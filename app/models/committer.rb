class Committer < ActiveRecord::Base
  attr_accessible :email, :name, :organization_id, :user_id

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 255 }

  belongs_to :organization
  belongs_to :user

  has_many :repositories, :as => :ownerable
  has_many :commit, :dependent => :destroy
end
