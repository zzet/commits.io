class Metrics::Presenter::CommitPresenter
  def initialize(commit_metric)
    @commit_metric = commit_metric
  end

  def percent
    if @commit_metric.data[:data].has_key?(:rate)
      (@commit_metric.data[:data][:rate] * 100).to_i
    else
      raise NotImplementedError
    end
  end
end
