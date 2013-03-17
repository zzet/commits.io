class Web::Repositories::CommitsController < Web::Repositories::ApplicationController

  def index
    @repository = resource_repository
    @commits = @repository.commits
  end

  def show
    @commit = Commit.find_by_sha(params[:sha])
  end
end
