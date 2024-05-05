require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the WeatherHelper. For example:
#
describe WeatherHelper do
  describe "format temperature" do
    it "formats temperature based on unit of measure" do
      expect(helper.format_temp(73, 'imperial')).to eq("73°F")
      expect(helper.format_temp(27, 'metric')).to eq("27°C")
      expect(helper.format_temp(9.27, 'invalid')).to eq("9°")
    end
  end
end
