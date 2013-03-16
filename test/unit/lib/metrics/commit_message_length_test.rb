require 'test_helper'

class Metrics::CommitMessageLengthTest < ActiveSupport::TestCase
  def test_could_calculate_metric
    data = generate :metrics_message
    data[:message] = "Test message"

    metric = Metrics::CommitMessageLength.new data
    metrics = metric.calculate([])
    assert_equal metrics, [{:metric=>:commit_message_length, :data=>{:length=>12, :rate=>0.6}}]
  end

  def test_rate
    data = generate :metrics_message
    data[:message] = "Test message"

    metric = Metrics::CommitMessageLength.new data

    assert_equal metric.rate(5), 0.25
    assert_equal metric.rate(12), 0.6
    assert_equal metric.rate(15), 0.75
    assert_equal metric.rate(20), 1
    assert_equal metric.rate(80), 1
    assert_equal metric.rate(100), 0.9
    assert_equal metric.rate(300), 0
  end
end
