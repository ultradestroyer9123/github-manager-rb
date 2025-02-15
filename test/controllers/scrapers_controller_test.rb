require "test_helper"

class ScrapersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scrapers_index_url
    assert_response :success
  end

  test "should get show" do
    get scrapers_show_url
    assert_response :success
  end

  test "should get create" do
    get scrapers_create_url
    assert_response :success
  end

  test "should get destroy" do
    get scrapers_destroy_url
    assert_response :success
  end
end
