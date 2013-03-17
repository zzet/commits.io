require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase

  def setup
    @user = create(:user)
    @params = { login: @user.login }

    sign_in(@user)
  end

  test "should get profile when login provided" do
    get :profile, @params

    assert_response :success
  end

  test 'should get profile' do
    get :profile

    assert_response :success
  end

  test 'should get dashboard' do
    get :dashboard

    assert_response :success
  end
end
