class CommitMetric < ActiveRecord::Base
  attr_accessible :commit_id, :data, :metric_id, :user_id

  belongs_to :metric
end
