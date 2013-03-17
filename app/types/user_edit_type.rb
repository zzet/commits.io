class UserEditType < User
  include BasicType

  validates :email, presence: true
end
