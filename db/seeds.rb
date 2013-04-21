Metric.kind.values.each do |metric|
  Metric.find_or_create_by_name(metric.humanize, kind: metric)
end
