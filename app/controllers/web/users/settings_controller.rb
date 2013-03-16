class Web::Users::SettingsController < Web::Users::ApplicationController
  def repositories
    github = Github.new oauth_token: get_auth_token
    @repositories = RepositoryBuilder.build_list(github.repos.list(user: resource_user.login), :github)
  end

  def create_repository
    repository = RepositoryBuilder.build(github.repos.get(user: resource_user.login, repo: params[:repository]), :github)
    repository.ownerable = resource_user
    RepositoryCreator.create(repository)

    redirect_to action: :repositories
  end

  def personal
  end
end
