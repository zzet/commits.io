class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :login, :image, :password, :password_confirmation, :birthday

  validates :email, uniqueness: { case_sensitive: false }
  validates :login, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :name, length: { maximum: 255 }

  has_many :auth_tokens
  has_many :authorizations
  has_many :user_badges, :dependent => :destroy
  has_many :repositories, dependent: :nullify
  has_one :committer, foreign_key: :email, primary_key: :email
  has_many :commit_metrics

  def guest?
    false
  end

  def build_auth_token
    token = SecureHelper.generate_token
    expired_at = Time.current + configus.token.lifetime
    auth_tokens.build :authentication_token => token, :expired_at => expired_at
  end

  class << self
    def birthday_year_min
      Date.today.year - 90
    end

    def birthday_year_max
      Date.today.year - 10
    end
  end
end
