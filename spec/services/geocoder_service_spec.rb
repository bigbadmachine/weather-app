require 'rails_helper'

RSpec.describe GeocoderService, 'call' do
  include_context "geocoder_client"

  context 'with valid address' do
    let(:response) { GeocoderService.call(VALID_ADDRESS) }

    before(:each) do
      allow(Geocoder).to receive(:search).and_return(valid_geocoder)
    end
    
    it 'returns successful Geocoder object' do
      expect(response.success?).to eq(true)
      expect(response.errors).to eq(nil)

      expect(response.object.latitude).to eq(geocoder.latitude)
      expect(response.object.longitude).to eq(geocoder.longitude)
      expect(response.object.postal_code).to eq(geocoder.postal_code)
    end
  end

  context 'with invalid address' do
    let(:response) { GeocoderService.call(INVALID_ADDRESS) }

    it 'returns errors' do
      expect(response.success?).to eq(false)
      expect(response.errors).not_to eq(nil)
      expect(response.object).to eq(nil)
    end
  end
end