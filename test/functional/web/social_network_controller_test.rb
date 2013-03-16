require 'test_helper'

class Web::SocialNetworkControllerTest < ActionController::TestCase

  setup do
    @auth_hash = generate(:github_auth_hash)
    @user = create :user
  end

  test "should get authorization with github" do    
    @user.authorizations << build_authorization(@auth_hash)
    @user.save

    request.env['omniauth.auth'] = @auth_hash
    get :authorization

    assert signed_in?
    assert_equal current_user, @user
    assert_response :redirect
  end

  test "should get authorization with github on existing user" do
    @user.login = @auth_hash[:extra][:raw_info][:login]
    @user.save

    request.env['omniauth.auth'] = @auth_hash
    get :authorization

    @user.reload
    assert signed_in?
    assert current_user.authorizations
    assert_response :redirect
  end

  test "should get authorization with github on new user" do
    request.env['omniauth.auth'] = @auth_hash
    get :authorization

    assert User.find_by_login(auth_hash[:extra][:raw_info][:login])
    assert signed_in?
    assert current_user.authorizations
    assert_response :redirect
  end

  test "should get failure" do
    get :failure
    assert_response :redirect
  end
end
