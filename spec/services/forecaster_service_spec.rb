require 'rails_helper'

RSpec.describe ForecasterService, 'call' do
  include_context "open_weather_client"

  context 'with valid coordinates' do
    let(:response) { ForecasterService.call(VALID_COORDINATES) }

    before(:each) do
      allow(OpenWeather::Client).to receive(:new).and_return(valid_client)
    end
    
    it 'returns successful Forecast object' do
      expect(response.success?).to eq(true)
      expect(response.errors).to eq(nil)

      expect(response.object).to be_a Forecast
      expect(response.object.current_temp).to eq( forecast.main.temp )
      expect(response.object.high_temp).to eq( forecast.main.temp_max)
      expect(response.object.low_temp).to eq( forecast.main.temp_min )
      expect(response.object.icon_url).to eq( forecast.weather.first.icon_uri )
      expect(response.object.description).to eq( forecast.weather.first.description )
      expect(response.object.units).to eq( 'metric' )
      expect(response.object.read_from_cache).to eq( false )
    end
  end

  context 'with invalid address' do
    let(:response) { ForecasterService.call(INVALID_COORDINATES) }

    it 'returns errors' do
      expect(response.success?).to eq(false)
      expect(response.errors).not_to eq(nil)
      expect(response.object).to eq(nil)
    end
  end
end