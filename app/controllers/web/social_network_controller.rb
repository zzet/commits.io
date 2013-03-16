class Web::SocialNetworkController < Web::ApplicationController

  def authorization
    authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])

    if authorization
      sign_in(authorization.user)
      save_auth_token(auth_hash[:credentials][:token])
      flash_success
    else
      user = User.find_or_initialize_by_login(auth_hash[:extra][:raw_info][:login])

      if user.new_record?
        user = UserPopulator.via_github(user, auth_hash)
      end

      user.authorizations << build_authorization(auth_hash)

      if user.save
        sign_in user
        save_auth_token(auth_hash[:credentials][:token])
        flash_success
      else
        flash_error
      end

    end

    redirect_to root_path
  end

  def failure
    flash_error
    redirect_to root_path
  end

end
