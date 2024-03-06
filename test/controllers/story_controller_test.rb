require "test_helper"

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get story_index_url
    assert_response :success
  end

  test "should show story" do
    get story_show_url
    assert_response :success
  end
end
