class Metrics::CommitMessageLength < Metrics::CommitMetric
  def calculate(metrics)
    metrics << {
      metric: :commit_message_length,
      data: {
        length:    @data["message"].length,
        rate: rate(@data["message"].length)
      }
    }
  end

  def rate(length)
    if length < 20
      length.to_f / 20
    else
      if length > 80
        if length <200 
          (280 - length).to_f / 200
        else
          0
        end
      else
        1.0
      end
    end
  end
end
