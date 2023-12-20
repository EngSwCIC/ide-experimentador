require 'rails_helper.rb'

RSpec.describe "Stop Experiment", :type => :feature do
    it "stops an experiment" do
        visit "/"
        click_button "stopExperiment"
        expect(page).to have_button("startButton")
    end
end