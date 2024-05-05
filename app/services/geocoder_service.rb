class GeocoderService < ApplicationService
  attr_reader :address 

  def initialize(address)
    @address = address
  end

  def call
    begin
      geocoder = Rails.cache.fetch(cache_key, expires_in: 1.day) do
        Geocoder.search(@address).first
      end
      
      if geocoder&.latitude
        return_success encapsulate(geocoder)
      else
        return_errors [I18n.t("errors.no_match")]
      end
    rescue
      return_errors [I18n.t("errors.general")]
    end
  end

  private

  def cache_key
    @address.parameterize
  end

  def encapsulate(geocoder)
    # returning as OpenStruct instead of Geocoder object
    # decouples ForecasterService from GeocoderService
    # Allows a simple change to another geocoding api/gem
    OpenStruct.new(
      latitude: geocoder.latitude, 
      longitude: geocoder.longitude, 
      postal_code: geocoder.postal_code
    )
  end
end