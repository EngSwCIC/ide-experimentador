Given(/^I am on the experiment page$/) do
    visit experiments_path
end

When(/^I click on the "(.*?)" button$/) do |button|
    click_button("startButton")
end

Then(/^I should see the experiment status as "(.*?)"$/) do |status|
    expect(page).to have_content(status)
end

When(/^I click on the "(.*?)" button again$/) do |button|
    click_button("stopButton")
end

Then(/^I should see the experiment status as "(.*?)" again$/) do |status|
    expect(page).to have_content(status)
end
