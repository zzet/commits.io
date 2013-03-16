class Metrics::CommitMessageLength < Metrics::Metric
  def calculate(metrics)
    metrics << {
      metric: :commit_message_length,
      data: {
        length:    @data[:data][:message].length,
        rate: (80 / @data[:data][:message].length).to_f
      }
    }
  end
end
