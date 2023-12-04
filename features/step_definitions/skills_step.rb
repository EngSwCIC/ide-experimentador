Given('that I have run a test in the simulator') do
end

When('I visit the skills visualization panel page') do
  visit '/graph/skills'
end

Then('I should see the robot\'s skills in the test run.') do
  assert_selector "p", text: string
end

Given('that the user analyzes the test execution logs') do
end

And('observes the timestamp field in each log entry') do
  expect(page).to have_selector('p', text: /^Time:/)
end

Then('the user observes, in addition to success and failure, at what point a skill is changed') do
  expect(page).to have_selector('p', text: /^Message:/)
end

Given('that the robot has different skills in its local plan') do
end

And('the progress of the plan depends on the success of each skill') do
  expect(page).to have_selector('p', text: /^Message:/)
end

Then('it should be informed whether the simulation was successful') do
  expect(page).to have_selector('p', text: "Experiment completed successfully")
end
