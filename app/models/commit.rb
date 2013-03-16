class Commit < ActiveRecord::Base
  attr_accessible :committer_id, :diff, :parent_sha, :repository_id, :sha

  has_many :commit_metrics, :dependent => :destroy

  validates :commiter, presence: true
  validates :repository, presence: true

  validates :commiter, presence: true
  validates :sha, presence: true, length: { maximum: 255 }
  validates :parent_sha, presence: true, length: { maximum: 255 }
end
