require 'rails_helper'

RSpec.describe "Simulators", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/simulators/index"
      expect(response).to have_http_status(:success)
    end
  end

end

RSpec.describe 'Simulators', type: :request do
  describe 'GET /index' do
    before(:example) { get simulators_path }  # get(:index)
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end
end


#capybara test
