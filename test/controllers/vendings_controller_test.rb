require "test_helper"

class VendingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vendings_index_url
    assert_response :success
  end
end
