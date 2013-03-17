class Repository < ActiveRecord::Base
  attr_accessible :name, :path, :source, :description, :clone_url, :external_id, :external_type, :is_fork

  validates :name, length: { maximum: 255 }, presence: true
  validates :path, length: { maximum: 255 }, if: -> { path.present? }
  validates :clone_url, length: { maximum: 255 }, presence: true

  has_many :commits, :dependent => :destroy

  belongs_to :ownerable, polymorphic: true
  belongs_to :user

  def to_s
    name
  end
end
