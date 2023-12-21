require 'rails_helper'

RSpec.describe "UserRegistrations", type: :request do
  describe "GET /users/sign_up" do
    it "renders the sign-up page successfully" do
      get '/users/sign_up'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "POST /users" do
    it "creates a new user upon sign-up" do
      params = { 
        user: {
          email: "test@example.com",
          password: "password",
          password_confirmation: "password"
        }
      }

      expect {
        post '/users', params: params
      }.to change(User, :count).by(1)

      expect(response).to redirect_to('/')
    end
  end
end




RSpec.describe "Password Reset", type: :request do
  describe "POST /users/password" do
    it "sends a password reset email to the user" do
      user = create(:user) # Assuming you have a factory or method to create a user

      # Simulate a request for password reset
      post user_password_path, params: { user: { email: user.email } }

      expect(response).to redirect_to(new_user_session_path)
      expect(flash[:notice]).to eq "You will receive an email with instructions on how to reset your password in a few minutes."

      # Assuming Devise uses ActionMailer for password reset emails
      expect(ActionMailer::Base.deliveries.last.to).to include(user.email)
      expect(ActionMailer::Base.deliveries.last.subject).to eq("Reset password instructions")
    end
  end
end