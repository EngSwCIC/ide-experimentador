require 'rails_helper.rb'

RSpec.describe "Start test by tag", :type => :feature do 
    it "starts a test by tag" do
        visit "/"
        :tag = "Velocity"
        click_button "startButton"
        expect(page).to have_content("Running")
        expect(page).to have_button("stopButton")
    end
end