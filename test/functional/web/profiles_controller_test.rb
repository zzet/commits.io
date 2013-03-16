require 'test_helper'

class Web::ProfilesControllerTest < ActionController::TestCase

  def setup
    @user = create(:user)
    @params = { login: @user.id }
  end

  test "should get show" do
    get :show, @params

    assert_response :success
  end
end
