require 'test_helper'

class Metrics::Builder::MessageSyntaxTest < ActiveSupport::TestCase
  def test_could_calculate_metric
    data = generate :metrics_message
    data["message"] = "Test mssage with irrors. Yes"

    metric = Metrics::Builder::MessageSyntax.new data
    metrics = metric.calculate
    assert_equal metrics, {
      :metric => :message_syntax,
      :data => {
        :words=>["Test", "mssage", "with", "irrors", "Yes"],
        :wrong_words=>["mssage", "irrors"],
        :rate=>0.6
      }
    }
  end
end
