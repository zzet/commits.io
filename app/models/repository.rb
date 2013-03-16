class Repository < ActiveRecord::Base
  attr_accessible :name, :path, :source

  validates :name,   length: { maximum: 255 }, presence: true
  validates :path,   length: { maximum: 255 }, if: -> { path.present? }
  validates :source, length: { maximum: 255 }, presence: true

  belongs_to :ownerable, polymorphic: true
end
