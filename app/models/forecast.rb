class Forecast
  EXPIRE_CACHE = 30.minutes
  DEFAULT_UNIT_MEASURE = 'imperial'

  attr_reader :current_temp, :high_temp, :low_temp, :icon_url, :description, :units
  attr_accessor :read_from_cache

  def initialize(args)
    @current_temp    = args[:current_temp]
    @high_temp       = args[:high_temp]
    @low_temp        = args[:low_temp]
    @icon_url        = args[:icon_url]
    @description     = args[:description]
    @read_from_cache = args[:read_from_cache]

    # imperial (Fahrenheit), metric (Celsius) or standard (Kelvin)
    @units = args[:units] || DEFAULT_UNIT_MEASURE 
  end
end