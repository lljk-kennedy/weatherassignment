require 'test_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest

	test "can see the welcome page" do
		get "/"
		assert_select "h1", "Iain Breen - 16 Day Weather Forecast Ruby on Rails Code Assessment for PlayON"
	end

	test "can search for a city" do
		get "/cities/Dublin"
		assert_response :success
	end

	test "can search for a city with a day specified" do
		get "/cities/Dublin?searchDay=1"
		assert_response :success
	end

	test "cannot search for a city with an invalid day specified" do
		get "/cities/Dublin?searchDay=100"
		assert_response :missing
	end
end
