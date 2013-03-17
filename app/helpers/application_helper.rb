module ApplicationHelper
  include CustomUrlHelper

  def link_to_repository(repository)
    "/#{repository.user.login}/#{repository.name}/"
  end

  def link_to_commit(commit)
    repo = link_to_repository commit.repository
    "#{repo}/commits/"
  end

  def link_to_user(email)
    user = User.find_by_email email

    if user
      "/profiles/#{user.login}"
    end
  end
end
