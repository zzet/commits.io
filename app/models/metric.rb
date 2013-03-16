class Metric < ActiveRecord::Base
  extend Enumerize

  attr_accessible :description, :name, :kind
  enumerize :kind, in: [:commit_message_syntax, :commit_message_profanity, :commit_message_length]

  has_many :commit_metrics, :dependent => :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :kind, presence: true
end
