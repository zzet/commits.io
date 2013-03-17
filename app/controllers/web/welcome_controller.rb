class Web::WelcomeController < Web::ApplicationController
  def show
    redirect_to dashboard_path if signed_in?
    @commits = Commit.scoped
  end
end
