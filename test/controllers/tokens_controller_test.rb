require "test_helper"

class TokensControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tokens_show_url
    assert_response :success
  end
end
