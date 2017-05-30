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
        @photo = City.getPhoto(params[:id])
        @city = City.find(params[:id])
        render action: 'display', id: params[:id], day: params[:searchDay]
      else
        @photo = City.getPhoto(params[:id])
        @city = City.find(params[:id])
      end
    end

    def display()
      l
        @photo = City.getPhoto(params[:id])
        @city = City.find(params[:id])
        logger.info "#{city}"
    end

  end

