class CommitMetric < ActiveRecord::Base
  attr_accessible :commit_id, :data, :metric_id, :user_id

  belongs_to :metric
  belongs_to :commit

  validates :commit, presence: true
  validates :data, presence: true
  validates :metric, presence: true

  def percent
    presenter.percent
  end

  def presenter
    @presenter ||= CommitsService.get_presenter(self)
  end
end
