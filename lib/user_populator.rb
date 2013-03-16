module UserPopulator
  
  def self.via_github(user, auth_hash)
    user.email = auth_hash[:info][:nickname]
    user.name = auth_hash[:info][:name]
    user.image = auth_hash[:info][:image]
    user.password = SecureHelper.generate_password

    user
  end

end
