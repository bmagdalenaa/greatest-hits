require "test_helper"

class LyricsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lyrics_index_url
    assert_response :success
  end
end
