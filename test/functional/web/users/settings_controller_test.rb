require 'test_helper'

class Web::Users::SettingsControllerTest < ActionController::TestCase

  def setup
    @user = create(:user)

    sign_in(@user)
  end

  test "should get repositories" do
    get :repositories, @params
    assert_response :success
  end

  test "should get personal" do
    get :personal, @params
    assert_response :success
  end
end
