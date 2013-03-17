require 'test_helper'

class Web::Users::SettingsControllerTest < ActionController::TestCase

  def setup
    @user = create(:user)

    sign_in(@user)
  end

  test "should get repositories" do
    repos_json = fixture_file_upload('repositories.json')
    stub_request(:get, "https://api.github.com/users/#{@user.login}/repos").
      with(:headers => {'Accept'=>'application/vnd.github.v3.full+json,application/vnd.github.beta.full+json;q=0.7,application/vnd.github+json;q=0.5,application/json;q=0.1', 'Accept-Charset'=>'utf-8', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Github Ruby Gem 0.9.0'}).
      to_return(:status => 200, :body => repos_json, :headers => {})

    get :repositories
    assert_response :success
  end

  test "should get personal" do
    get :personal
    assert_response :success
  end

  test "should put update_personal" do
    attrs = {}
    attrs[:name] = generate(:name)

    put :update_personal, user: attrs

    @user.reload
    assert_equal attrs[:name], @user.name
    assert_response :success
  end

  test "should post activate_repository" do
    repo_json = fixture_file_upload('repository.json')
    stub_request(:get, "https://api.github.com/repos/#{@user.login}/akalyaev.github.com").
      with(:headers => {'Accept'=>'application/vnd.github.v3.full+json,application/vnd.github.beta.full+json;q=0.7,application/vnd.github+json;q=0.5,application/json;q=0.1', 'Accept-Charset'=>'utf-8', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Github Ruby Gem 0.9.0'}).
      to_return(:status => 200, :body => repo_json, :headers => {})
    Resque.expects(:enqueue_to).returns(true)

    post :activate_repository, { repository: 'akalyaev.github.com' }
    assert_redirected_to action: :repositories
  end
end
