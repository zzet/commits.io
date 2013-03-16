class Metrics::Metric
  def initialize(data)
    @data = data
  end

  def calculate(metrics)
    raise NotImplementedError
  end
end