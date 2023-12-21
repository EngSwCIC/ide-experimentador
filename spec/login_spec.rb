require 'rails_helper'

RSpec.describe "Sessions", type: :request do
    describe "POST /users/sign_in" do
      let!(:user) { create(:user, email: 'test5@example.com', password: 'password123') }
  
      it "logs in an existing user" do
        post '/users/sign_in', params: { user: { email: 'test5@example.com', password: 'password123' } }
        #expect(response).to have_http_status(:success)
        expect(response).to redirect_to('/')
        #expect(response.body).to include('Signed in successfully.')
      end
  
      it "returns an error for invalid credentials" do
        post '/users/sign_in', params: { user: { email: 'test@example.com', password: 'wrong_password' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include('Invalid Email or password.')
      end
    end
  end


  RSpec.describe "Logout", type: :request do
    let(:user) { create(:user) } # Assuming you have a factory or method to create a user
  
    it "logs out a signed-in user" do
      post '/users/sign_in', params: { user: { email: 'test5@example.com', password: 'password123' } }
  
      # Sign out the user
      get '/users/sign_out'
  
      expect(response).to redirect_to('/')
      expect(controller.current_user).to be_nil
    end
  end


RSpec.describe "Restricted Page", type: :request do
    describe "GET /restricted" do
      it "redirects unauthenticated users to the sign-in page" do
        get "/restricted"
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end