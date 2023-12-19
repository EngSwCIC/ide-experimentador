require 'rails_helper.rb'

RSpec.describe "GraphController", type: :request do
  describe "GET graph#jsonGet" do
    it "Acessa velocity/getData/:id" do
      get velocity_getData_path
      expect(response).to have_http_status(200)
    end
  end