require 'test_helper'

class Metrics::MetricTest < ActiveSupport::TestCase
  def test_could_raise_not_implemented
    metric = Metrics::Metric.new generate :metrics_message
    assert_raise(NotImplementedError) { metric.calculate([]) }
  end
end
