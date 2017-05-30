require 'test_helper'

class SearchFlowsTest < ActionDispatch::IntegrationTest
  test "full run0-through test" do
    get "/"
    assert_response :success

    get "/cities/Dublin"
    assert_response :success

    get "/cities/Dublin?searchDay=1"
    assert_response :success
  end
end
