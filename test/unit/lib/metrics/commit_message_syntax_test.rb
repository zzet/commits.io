require 'test_helper'

class Metrics::CommitMessageSyntaxTest < ActiveSupport::TestCase
  def test_could_calculate_metric
    data = generate :metrics_message
    data[:data][:message] = "Test mssage with irrors. Yes"

    metric = Metrics::CommitMessageSyntax.new data
    metrics = metric.calculate([])
    assert_equal metrics, [{
      :metric => :commit_message_syntax,
      :data => {
        :words=>["Test", "mssage", "with", "irrors", "Yes"],
        :wrong_words=>["mssage", "irrors"],
        :rate=>0.6
      }
    }]
  end
end
