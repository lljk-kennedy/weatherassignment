class City < ApplicationRecord
	require 'rest_client'

	attr_accessor :cityToFind
	attr_accessor :dayToFind

	DAYS = "16"
	GOOGLE_SEARCH = "https://www.googleapis.com/customsearch/v1?key=#{APP_CONFIG['GOOGLE_API_KEY']}&cx=#{APP_CONFIG['GOOGLE_SEARCH_ENGINE_ID']}"
	
	def self.find(id)
		uri = "#{APP_CONFIG['WEATHER_API_BASE_URL']}/daily?q=#{id}&cnt=#{DAYS}&units=metric&APPID=#{APP_CONFIG['WEATHER_APP_ID']}" # specifying json format in the URl
            	logger.info "Getting #{uri}"
            	rest_resource = RestClient::Resource.new(uri) # It will create new rest-client resource so that we can call different methods of it
            	cities = rest_resource.get # will get back you all the detail in json format, but it will we wraped as string, so we will parse it in the next step.
            	cities = JSON.parse(cities, :symbolize_names => true) # we will convert the return data into array of hash.see json data parsing here
            	return cities
	end

	def self.getPhoto(id)
  		url = "#{GOOGLE_SEARCH}&q=#{id}+City+panorama&searchType=image&imgType=photo&fileType=jpg&imgSize=huge&safe=high&alt=json"
  		logger.info "Getting images for #{id} from #{url}"
  		rest_resource = RestClient::Resource.new(url) 
  		photos = rest_resource.get
  		photos_json = JSON.parse(photos, :symbolize_names => true )

  		 logger.info "#{photos_json[:items].length}"
  		 logger.info "Image is at #{@photo}"
		return photo = photos_json[:items][0][:link]
		
  	end
end
