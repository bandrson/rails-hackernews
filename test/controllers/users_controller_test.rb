require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_url
    assert_response :success
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end
end
