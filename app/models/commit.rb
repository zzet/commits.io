class Commit < ActiveRecord::Base
  attr_accessible :committer_id, :diff, :parent_sha, :repository_id, :sha, :message

  has_many :commit_metrics, :dependent => :destroy

  belongs_to :committer
  belongs_to :repository

  validates :committer, presence: true
  validates :repository, presence: true
  validates :sha, presence: true, length: { maximum: 255 }
  validates :parent_sha, presence: true, length: { maximum: 255 }
  validates :message, presence: true, length: { maximum: 255 }

  scope :top, -> { joins(:commit_metrics).select('commits.id, SUM(commit_metrics.percent) as total_percent').group('commits.id').order('total_percent ASC') }
end
