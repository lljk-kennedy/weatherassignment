class CitiesController < ApplicationController
	require 'rest_client'

	API_BASE_URL = "http://api.openweathermap.org/data/2.5/forecast"
	GOOGLE_API = "AIzaSyDs_WMIT_2I10AqA_vlTRYiVyov2Jzhd40"
	APP_ID = "bfa2cf09c54b38f69a0eb617e2ea57b3"
	SEARCH_ENGINE_ID = "003860170648715383525:7ds0wpfjxoo"
	DAYS = "16"

	GOOGLE_SEARCH = "https://www.googleapis.com/customsearch/v1?key=#{GOOGLE_API}&cx=#{SEARCH_ENGINE_ID}"

	def new
  	
  	end

	 def index
  		@thisCity = params[:searchCity]
  		@day = params[:searchDay]
  		uri = "#{API_BASE_URL}/daily?q=#{@thisCity}&cnt=#{DAYS}&units=metric&APPID=#{APP_ID}" # specifying json format in the URl
  		logger.info "Getting #{uri}"
  		rest_resource = RestClient::Resource.new(uri) # It will create new rest-client resource so that we can call different methods of it
  		cities = rest_resource.get # will get back you all the detail in json format, but it will we wraped as string, so we will parse it in the next step.
  		@cities = JSON.parse(cities, :symbolize_names => true) # we will convert the return data into array of hash.see json data parsing here
  		getPhoto
  	end

  	def show
  		@thisCity = params[:city]
  		uri = "#{API_BASE_URL}/daily?q=#{@thisCity}&cnt=#{DAYS}&units=metric&APPID=#{APP_ID}" # specifying json format in the URl
  		logger.info "Getting #{uri}"
  		rest_resource = RestClient::Resource.new(uri) # It will create new rest-client resource so that we can call different methods of it
  		cities = rest_resource.get # will get back you all the detail in json format, but it will we wraped as string, so we will parse it in the next step.
  		@cities = JSON.parse(cities, :symbolize_names => true) # we will convert the return data into array of hash.see json data parsing here
  	end

  	def search
  		@thisCity = params[:city]
  		uri = "#{API_BASE_URL}/daily?q=#{@thisCity}&cnt=#{DAYS}&units=metric&APPID=#{APP_ID}" # specifying json format in the URl
  		logger.info "Getting #{uri}"
  		rest_resource = RestClient::Resource.new(uri) # It will create new rest-client resource so that we can call different methods of it
  		cities = rest_resource.get # will get back you all the detail in json format, but it will we wraped as string, so we will parse it in the next step.
  		@cities = JSON.parse(cities, :symbolize_names => true) # we will convert the return data into array of hash.see json data parsing here
  		getPhoto
  	end

  	def getPhoto
  		url = "#{GOOGLE_SEARCH}&q=#{@thisCity}+City+panorama&searchType=image&imgType=photo&fileType=jpg&imgSize=huge&safe=high&alt=json"
  		logger.info "Getting images for #{@thisCity} from #{url}"
  		rest_resource = RestClient::Resource.new(url) 
  		photos = rest_resource.get
  		photos_json = JSON.parse(photos, :symbolize_names => true )

  		 logger.info "#{photos_json[:items].length}"
  		 
		@photo = photos_json[:items][0][:link]
		logger.info "Image is at #{@photo}"
  	
  	end

end
