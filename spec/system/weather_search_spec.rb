require 'rails_helper'

RSpec.describe 'Weather search', type: :system, js: true do
  include_context "geocoder_client"
  include_context "open_weather_client"

  context 'with a valid address' do
    before(:each) do
      allow(Geocoder).to receive(:search).and_return(valid_geocoder)
      allow(OpenWeather::Client).to receive(:new).and_return(valid_client)
    end

    it 'shows the current weather' do
      visit root_path
      expect(page).to have_content("How's the weather in...")

      fill_in 'address', with: '1 Apple Park Way, Cupertino, CA 95014'
      find(:css, '#unit').find(:option, "°C").select_option
      click_button 'Search'

      expect(page).to have_content("CURRENT WEATHER")
      expect(page).to have_content("24°C")
      expect(page).to have_content("27°C")
      expect(page).to have_content("17°C")
      expect(page).to have_content("few clouds")
      expect(page).to have_xpath("//img[@src='http://weather/icon/uri.png']")
    end
  end

  context 'with an invalid address' do
    # before(:each) do
    #   allow(OpenWeather::Client).to receive(:new).and_return(invalid_client)
    # end

    it 'shows an error message' do
      visit root_path
      click_button 'Search'
      # expect(page).to have_turbo_frame('forecast')
      expect(page).to have_content("Something went wrong, please try again.")
    end
  end
end