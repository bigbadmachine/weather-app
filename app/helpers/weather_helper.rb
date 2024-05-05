module WeatherHelper

  def format_temp(temp, unit_of_measure)
    temp = temp.to_f.round

    case unit_of_measure
    when 'standard'
      # Kelvin
      "#{temp}K"
    when 'metric'
      # Celsius
      "#{temp}°C"
    when 'imperial'
      # Fahrenheit
      "#{temp}°F"
    else
      "#{temp}°"
    end
  end
end
