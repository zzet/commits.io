class Commit < ActiveRecord::Base
  attr_accessible :committer_id, :diff, :parent_sha, :repository_id, :sha, :message, :committed_at

  has_many :commit_metrics, :dependent => :destroy

  belongs_to :committer
  belongs_to :repository

  validates :committer, presence: true
  validates :repository, presence: true
  validates :sha, presence: true, length: { maximum: 255 }
  validates :parent_sha, length: { maximum: 255 }
  validates :message, presence: true
  validates :committed_at, presence: true

  scope :bottom, -> { order(:percent).limit(10) }
  scope :top, -> { where('percent > 0').order("percent DESC").limit(10) }
end
