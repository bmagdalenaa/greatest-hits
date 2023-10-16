require "test_helper"

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get albuns_index_url
    assert_response :success
  end
end
