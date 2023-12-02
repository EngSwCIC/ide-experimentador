require 'rails_helper'

RSpec.describe "Simulators", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/simulators/index"
      expect(response).to have_http_status(:success)
    end
  end

end
