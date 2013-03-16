require 'test_helper'

class Web::RepositoriesControllerTest < ActionController::TestCase

  test "should get show with committer" do
    committer = create(:committer)
    repository = committer.repositories.first

    params = { owner: committer.to_s, repository: repository.to_s }
    get :show, params

    assert_response :success
  end

  test "should get show with organization" do
    organization = create(:organization)
    repository = organization.repositories.first

    params = { owner: organization.to_s, repository: repository.to_s }
    get :show, params

    assert_response :success
  end

  test "should get commits with committer" do
    committer = create(:committer)
    repository = committer.repositories.first

    params = { owner: committer.to_s, repository: repository.to_s }
    get :commits, params

    assert_response :success
  end

  test "should get commits with organization" do
    organization = create(:organization)
    repository = organization.repositories.first

    params = { owner: organization.to_s, repository: repository.to_s }
    get :commits, params

    assert_response :success
  end
end
