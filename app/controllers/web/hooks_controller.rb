class Web::HooksController < Web::ApplicationController
  def create
    Resque.enqueue_to :hook, ::HookWorker, params[:payload]
    head :ok
  end
end
