require 'rails_helper'

RSpec.describe Forecast, type: :model do
  subject { build(:forecast) }

  it "has attributes" do
    expect(subject.current_temp).to eq("82")
    expect(subject.high_temp).to eq("84")
    expect(subject.low_temp).to eq("78")
    expect(subject.icon_url).to eq("http://openweathermap.org/img/wn/09d@2x.png")
    expect(subject.description).to eq("light intensity drizzle")
    expect(subject.units).to eq("metric")
    expect(subject.read_from_cache).to eq(false)
  end

  it "has a default unit" do
    default_forecast = build(:forecast, units: nil)
    expect(default_forecast.units).to eq("imperial")
  end
  
end
