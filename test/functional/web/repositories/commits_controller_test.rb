require 'test_helper'

class Web::Repositories::CommitsControllerTest < ActionController::TestCase

  test "should get index with committer" do
    committer = create(:committer)
    repository = committer.repositories.first

    params = { owner: committer.to_s, repository: repository.to_s }
    get :index, params

    assert_response :success
  end

  test "should get index with organization" do
    organization = create(:organization)
    repository = organization.repositories.first

    params = { owner: organization.to_s, repository: repository.to_s }
    get :index, params

    assert_response :success
  end
end
