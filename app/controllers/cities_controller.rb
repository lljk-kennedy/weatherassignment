class CitiesController < ApplicationController
	require 'rest_client'

	def index
		redirect_to action: 'show', id: params[:city]
	end

	def search
		redirect_to action: 'show', id: params[:city]
	end

	def show
		if (params.has_key?(:searchDay))
			if (params[:searchDay].to_i >=1 and params[:searchDay].to_i < 16)
          			#@photo = City.getPhoto(params[:id])
          			@city = City.find(params[:id])
          			@day = params[:searchDay]
          			render action: 'display', id: params[:id], day: params[:searchDay]
       			else
       				render_404
       			end
       		else
        			#@photo = City.getPhoto(params[:id])
        			@city = City.find(params[:id])
     		end
  	end

  	def render_404
	  respond_to do |format|
	    format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
	    format.xml  { head :not_found }
	    format.any  { head :not_found }
	  end
	end
end

