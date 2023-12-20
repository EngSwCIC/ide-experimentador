require 'rails_helper.rb'

RSpec.describe "Start Experiment", :type => :feature do
  it "starts an experiment" do
    visit "/"
    click_button "startButton"
    expect(page).to have_content("Running")
    expect(page).to have_button("stopExperiment")
  end
end