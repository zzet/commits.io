class Metric < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :commit_metrics, :dependent => :destroy
end
