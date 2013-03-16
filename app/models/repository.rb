class Repository < ActiveRecord::Base
  attr_accessible :name, :path

  validates :name, presence: true, length: { maximum: 255 }
  validates :path, presence: true, length: { maximum: 255 }

  belongs_to :ownerable, polymorphic: true
end
