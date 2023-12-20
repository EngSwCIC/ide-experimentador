require 'rails_helper'

RSpec.describe "Classifications", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/classifications/index"
      expect(response).to have_http_status(:success)
    end
  end

end
