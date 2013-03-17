class Metric < ActiveRecord::Base
  extend Enumerize

  attr_accessible :description, :name, :kind
  enumerize :kind, in: [:message_syntax, :message_profanity, :message_length]

  has_many :commit_metrics, :dependent => :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :kind, presence: true, uniqueness: { case_sensitive: false }
end
