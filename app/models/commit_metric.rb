class CommitMetric < ActiveRecord::Base
  attr_accessible :commit_id, :data, :metric_id, :user_id, :rate, :metric_coumt
  belongs_to :metric
  belongs_to :commit
  belongs_to :user

  validates :commit, presence: true
  validates :data, presence: true
  validates :metric, presence: true

  def presenter
    @presenter ||= CommitsService.get_presenter(self)
  end
end
