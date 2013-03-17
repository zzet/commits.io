class Web::Repositories::CommitsController < Web::Repositories::ApplicationController

  def index
    @repository = Repository.find_by_name!(params[:repository])
    @commits = @repository.commits
  end

  def show
  end
end
