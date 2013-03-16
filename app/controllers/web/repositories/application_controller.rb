class Web::Repositories::ApplicationController < Web::ApplicationController

  def resource_repository
    Repository.find_by_name(params[:repository])
  end
end
