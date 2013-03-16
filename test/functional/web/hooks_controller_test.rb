require 'test_helper'

class Web::HooksControllerTest < ActionController::TestCase
  test "should recive post data from github" do
    Resque.stubs(:enqueue_to).returns(true)

    f = fixture_file_upload('hook_post.json', 'application/json')
    set_raw_post_data(f.read)

    post :create

    assert_response :success
  end
end
