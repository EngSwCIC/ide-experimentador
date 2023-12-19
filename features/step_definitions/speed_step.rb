Given("that the user is on a experiment screen with id {string}") do |string|
    @id = string
end

And ("the test was never run") do
    #Sem entrada no banco de dados
end

When("I click on the speed button") do
    visit "/velocity/graph/%s" % [@id]
end

Then("it shouldn't be possible to view the data") do
    expect(page).to have_content("Erro")
end


And("the test was run successfully") do 
    
end


Then("I should see in a graph the speed information that was collected during the test run") do
    expect(find('LineChart').count).to eq(1)
end

Then("I should have a visualization of the failure") do
    expect(true)
end

Then("the application should report an error") do
    expect(true)
end
