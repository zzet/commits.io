require 'test_helper'

class MetricsTest < ActiveSupport::TestCase
  def test_get_metrics_for_data
    data = generate :metrics_message
    data[:message] = "Fucking test mssage with irrors. Yes"

    metrics = Metrics.get_metrics_for data

    assert_equal metrics, [
      {:metric=>:commit_message_syntax, :data=>{:words=>["Fucking", "test", "mssage", "with", "irrors", "Yes"], :wrong_words=>["mssage", "irrors"], :rate=>0.6666666666666667}}, 
      {:metric=>:commit_message_profanity, :data=>{:words=>["Fucking", "test", "mssage", "with", "irrors", "Yes"], :wrong_words=>["fucking"], :rate=>0.8333333333333334}}, 
      {:metric=>:commit_message_length, :data=>{:length=>36, :rate=>1.0}}
    ]
  end

end
