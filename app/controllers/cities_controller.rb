class CitiesController < ApplicationController
  def index
  end

  def view
    # get city name
    @city = params[:city]
    # url for weather
    url = "http://api.openweathermap.org/data/2.5/weather"
    
    response = Faraday.get do |req| 
      req.url url , :q => @city
      req.params['APPID'] = ENV['APPID']
      req.params['units'] = 'metric'
    end

    @temp = JSON.parse response.body

  end
end
