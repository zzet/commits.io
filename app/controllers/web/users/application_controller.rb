class Web::Users::ApplicationController < Web::ApplicationController

  def resource_user
    current_user
  end
end
