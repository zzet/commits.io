class Web::UsersController < Web::ApplicationController

  def dashboard
    authenticate!

    @commits = Commit.scoped
  end

  def profile
    @user = User.find_by_login!(params[:login]) if params[:login]
    @user ||= current_user if signed_in?
    raise ActiveRecord::RecordNotFound unless @user.present?
  end
end
