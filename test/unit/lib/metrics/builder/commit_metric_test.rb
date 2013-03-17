require 'test_helper'

class Metrics::Builder::CommitMetricTest < ActiveSupport::TestCase
  def test_could_raise_not_implemented
    metric = Metrics::Builder::CommitMetric.new generate :metrics_message
    assert_raise(NotImplementedError) { metric.calculate }
  end
end
