require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comment_url
    assert_response :success
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end
end
