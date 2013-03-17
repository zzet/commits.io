class Web::RepositoriesController < ApplicationController

  def show
    @repository = Repository.find_by_name!(params[:repository])
    @commits = @repository.commits
  end
end
