require 'test_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get search" do
    get "http://localhost:3000/search?city=Madrid"
    assert_response :success
  end

   test "should get details" do
    get cities_url+"?searchCity=Madrid&searchDay=1"
    assert_response :success
    
  end
end
