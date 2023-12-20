require 'rails_helper.rb'

RSpec.describe "Stop Text By Tag", :type => :feature do
    it "stops a text by tag" do
        visit "/"
        :tag = "Velocity"
        click_button "stopButton"
        expect(page).to have_button("startButton")
    end
end