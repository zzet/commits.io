require 'test_helper'

class Metrics::Builder::MessageProfanityTest < ActiveSupport::TestCase
  def test_could_calculate_metric
    data = generate :metrics_message
    data["message"] = "Test fucking message wohooo!"

    metric = Metrics::Builder::MessageProfanity.new data
    metrics = metric.calculate
    assert_equal metrics, {
      :metric => :message_profanity,
      :data => {
        :words => ["Test", "fucking", "message", "wohooo"],
        :wrong_words=>["fucking"],
        :rate=>0.75
      }
    }
  end
end
