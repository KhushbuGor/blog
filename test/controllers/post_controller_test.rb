require "test_helper"

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get post_show_url
    assert_response :success
  end

  test "should get update" do
    get post_update_url
    assert_response :success
  end

  test "should get destroy" do
    get post_destroy_url
    assert_response :success
  end
end
