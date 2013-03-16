class Web::UsersController < Web::ApplicationController

  def dashboard
    authenticate!
  end

  def profile
    @user = current_user if signed_in?
    @user ||= User.find_by_login!(params[:login])
  end
end
