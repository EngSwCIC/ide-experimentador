#Implementing the steps in view_and_filter.features
# Scenario: User views all experiments on the index screen

Given("the user is on the index experiment screen") do
  visit '/experiments/index' 
end

# To-Do

Then("the user should see all experiments") do
  expect(page).to have_content('Experiment 1')
  expect(page).to have_content('Experiment 2')
  expect(page).to have_content('Experiment 3')
  expect(page).to have_content('Experiment 4')
  expect(page).to have_content('Experiment 5')
  expect(page).to have_content('Experiment 6')
end

# Scenario: User filters experiments by name
When("the user fills the search input with {string}") do |search_term|
  fill_in 'searchInput', with: search_term 
end

# To-Do
Then("the user should see all experiments {string}") do |search_term|
  expect(page).to have_content(search_term)
end

#Scenario: User doesn't fill the search bar
When("the user doesn't fill the fields") do
  fill_in 'searchInput', with: "" 
end

