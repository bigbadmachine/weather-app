class WeatherService < ApplicationService
  attr_reader :address, :options

  def initialize(address, options={})
    @address = address
    @options = options
  end

  def call
    result = GeocoderService.call(@address)
    return result unless result.success?

    geocoder = result.object

    ForecasterService.call(
      latitude: geocoder.latitude, 
      longitude: geocoder.longitude, 
      postal_code: geocoder.postal_code,
      options: @options
    )
  end
end