FactoryBot.define do
  factory(:forecast) do
    current_temp { "82" }
    high_temp { "84" }
    low_temp { "78" }
    icon_url { "http://openweathermap.org/img/wn/09d@2x.png" }
    description { "light intensity drizzle" }
    units { 'metric' }
    read_from_cache { false }

    initialize_with { 
      new(
        current_temp: current_temp,
        high_temp: high_temp,
        low_temp: low_temp,
        icon_url: icon_url,
        description: description,
        units: units,
        read_from_cache: read_from_cache
      )
    }
  end
end