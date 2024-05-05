class ForecasterService < ApplicationService
  attr_reader :latitude, :longitude, :postal_code, :options

  def initialize(args)
    @latitude     = args[:latitude]
    @longitude    = args[:longitude]
    @postal_code  = args[:postal_code]
    @options      = args[:options] || {}
  end

  def call
    begin
      read_from_cache = Rails.cache.exist?(cache_key)

      forecast = Rails.cache.fetch(cache_key, expires_in: Forecast::EXPIRE_CACHE) do
        data = client.current_weather(
          lat: @latitude, 
          lon: @longitude,
          units: unit_of_measure
        )

        Forecast.new({
          current_temp: data.main.temp,
          high_temp: data.main.temp_max,
          low_temp: data.main.temp_min,
          icon_url: data.weather.first.icon_uri.to_s,
          description: data.weather.first.description,
          units: unit_of_measure,
          read_from_cache: false
        })
      end

      forecast.read_from_cache = read_from_cache
      return_success forecast
    rescue
      return_errors [I18n.t("errors.general")]
    end
  end

  private

  def client
    api_key = Rails.application.credentials.openweather_api_key
    OpenWeather::Client.new(api_key: api_key)
  end

  def cache_key
    # use postal_code as cache_key if available
    # otherwise use lat|long ("18.0200947|-76.7899587")
    # prepend unit_of_measure into key 
    
    [unit_of_measure, (@postal_code || [@latitude, @longitude])].flatten.join('|')
  end

  def unit_of_measure
    # Future support for changing units
    @options[:units] ||= Forecast::DEFAULT_UNIT_MEASURE
  end

end