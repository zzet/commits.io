class Web::Users::SettingsController < Web::Users::ApplicationController
  def repositories
    github = Github.new oauth_token: get_auth_token
    external_repositories = RepositoryBuilder.build_list(github.repos.list(user: resource_user.login), :github)
    internal_repositories = resource_user.repositories
    @repositories = external_repositories.map {|er| internal_repositories.find_by_name(er.name) || er }
  end

  def activate_repository
    github = Github.new oauth_token: get_auth_token
    repository = RepositoryBuilder.build(github.repos.get(resource_user.login, params[:repository]), :github)

    # TODO [AK] think about this place
    committer = resource_user.committer
    repository.ownerable = committer if committer

    repository.user = resource_user
    RepositoryCreator.create(repository)

    redirect_to action: :repositories
  end

  def personal
    @user = resource_user
  end

  def update_personal
    @user = resource_user

    unless @user.update_attributes(params[:user])
      flash_error
    end

    render action: :personal
  end
end
