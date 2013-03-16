class Badge < ActiveRecord::Base
  attr_accessible :description, :image, :name

  has_many :user_badges, :dependent => :destroy
end
