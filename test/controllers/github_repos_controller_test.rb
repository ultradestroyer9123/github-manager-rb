require "test_helper"

class GithubReposControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get github_repos_index_url
    assert_response :success
  end
end
