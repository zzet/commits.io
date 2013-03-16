class Commit < ActiveRecord::Base
  attr_accessible :committer_id, :diff, :parent_sha, :repository_id, :sha

  has_many :commit_metrics, :dependent => :destroy

  belongs_to :committer
  belongs_to :repository

  validates :committer, presence: true
  validates :repository, presence: true
  validates :sha, presence: true, length: { maximum: 255 }
  validates :parent_sha, presence: true, length: { maximum: 255 }
end
