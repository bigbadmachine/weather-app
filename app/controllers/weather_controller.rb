class WeatherController < ApplicationController
  def index
  end

  def search
    result = WeatherService.call(params[:address], units: params[:unit])
    
    if result.errors.nil? || result.errors.empty?
      @forecast = result.object
    else
      @errors = result.errors
    end
  end
end
