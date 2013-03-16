require 'test_helper'

class Metrics::CommitMessageLengthTest < ActiveSupport::TestCase
  def test_could_calculate_metric
    data = generate :metrics_message
    data[:data][:message] = "Test message"

    metric = Metrics::CommitMessageLength.new data
    metrics = metric.calculate([])
    assert_equal metrics, [{:metric=>:commit_message_length, :data=>{:length=>12, :rate=>6.0}}]
  end
end
