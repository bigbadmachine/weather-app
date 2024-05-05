require 'rails_helper'

RSpec.describe WeatherService, 'call' do
  include_context "geocoder_client"
  include_context "open_weather_client"

  context 'with valid address' do
    let(:response) { WeatherService.call(VALID_ADDRESS) }

    before(:each) do
      allow(Geocoder).to receive(:search).and_return(valid_geocoder)
      allow(OpenWeather::Client).to receive(:new).and_return(valid_client)
    end
    
    it 'returns successful Forecast object' do
      expect(response.success?).to eq(true)
      expect(response.errors).to eq(nil)
      expect(response.object).to be_a Forecast
    end
  end

  context 'with invalid address' do
    let(:response) { WeatherService.call(INVALID_ADDRESS) }

    before(:each) do
      allow(OpenWeather::Client).to receive(:new).and_return(invalid_client)
    end

    it 'returns errors' do
      expect(response.success?).to eq(false)
      expect(response.errors).not_to eq(nil)
      expect(response.object).to eq(nil)
    end
  end
end