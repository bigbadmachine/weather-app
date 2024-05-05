RSpec.shared_context "geocoder_client" do

  VALID_ADDRESS ||= '1 Apple Park Way, Cupertino, CA 95014'
  
  INVALID_ADDRESS ||= ''

  let(:geocoder) { 
    OpenStruct.new(
      latitude: 37.3362065,
      longitude: -122.0069962,
      postal_code: "94087"
    )
  }

  let(:valid_geocoder) do
    double(Geocoder, first: geocoder)
  end

end