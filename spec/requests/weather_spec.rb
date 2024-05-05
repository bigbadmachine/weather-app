require 'rails_helper'

RSpec.describe "Weather", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /search" do
    it "returns http success" do
      post search_path, as: :turbo_stream
      expect(response).to have_http_status(:success)
    end
  end
end
