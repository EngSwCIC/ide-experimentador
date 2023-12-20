require 'rails_helper'

RSpec.describe "Trials", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/trials/index"
      expect(response).to have_http_status(:success)
    end
  end

end
