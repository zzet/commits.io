require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase

  test "should get show" do
    get :show
    assert_response :success
  end

  test 'should redirect to dashboard if user signed in' do
    user = create(:user)
    sign_in(user)

    get :show

    assert_redirected_to dashboard_path
  end
end
