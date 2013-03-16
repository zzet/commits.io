class Metrics
  def self.get_metrics_for(data)
    metrics = []

    ::Metric.kind.values.each do |metric_name|
      klass = "Metrics::Builder::#{metric_name.camelize}".constantize
      metric = klass.new (data)
      metrics << metric.calculate
    end

    metrics
  end

end
