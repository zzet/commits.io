class Metrics::CommitMetric
  def initialize(data)
    @data = data
  end

  def calculate(metrics)
    raise NotImplementedError
  end

  protected

  def split_words(text)
    text.scan(/\w+/)
  end
end
