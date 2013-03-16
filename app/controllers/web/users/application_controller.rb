class Web::Users::ApplicationController < Web::ProtectedApplicationController

  def resource_user
    current_user
  end
end
