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
        return_success geocoder
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
end