class Organization < ActiveRecord::Base
  attr_accessible :company, :name

  validates :name, presence: true, length: { maximum: 255 }

  has_many :repositories, :as => :ownerable
end
