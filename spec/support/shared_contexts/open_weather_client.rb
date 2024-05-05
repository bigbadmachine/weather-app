RSpec.shared_context "open_weather_client" do

  VALID_COORDINATES ||= {
    latitude: 37.3362065,
    longitude: -122.0069962,
    postal_code: "94087",
    options: {units: 'metric'}
  }
  
  INVALID_COORDINATES ||= {}

  let(:forecast) { 
    JSON.parse({
      main: {
        temp: 23.64,
        temp_max: 27.01,
        temp_min: 16.73
      },
      weather: [{
        icon_uri: "http://weather/icon/uri.png",
        description: "few clouds"
      }]
    }.to_json, object_class: OpenStruct)
  }

  let(:valid_client) do
    instance_double(OpenWeather::Client, current_weather: forecast)
  end

  let(:invalid_client) { nil }

end