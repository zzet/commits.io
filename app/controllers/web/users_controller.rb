class Web::UsersController < Web::ApplicationController

  def dashboard
    authenticate!
  end

  def profile
    @user = current_user if signed_in?
    @user ||= User.find_by_login!(params[:login])

    @best_commits = Commit.best_top
    @worst_commits = Commit.worst_top
  end
end
