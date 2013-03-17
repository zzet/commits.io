class Metrics::Builder::CommitMetric
  def initialize(data)
    @data = data
  end

  def calculate
    raise NotImplementedError
  end

  protected

  def split_words(text)
    text.scan(/\w+/)
  end
end
