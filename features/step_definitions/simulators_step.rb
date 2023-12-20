Given 'that I am on the settings page' do
    visit simulators_path
end

Then ('I should see {string} on h1') do |string|
    assert_selector "h1", text: string
end

And('add {string}') do |string|
    fill_in "Nome do Simulador:", with: string
end

And 'click "Registrar"' do
    click_on "Registrar"
end

Then ('I should see {string} on div') do |string|
    assert_selector "div", text: string
end

When ('I click on the {string} button') do |string|
    click_on string, match: :first
end

Then 'I should see "Ativado" on the screen' do
    assert_selector "button", text: "Ativado"
end

Then 'I should see "Desativado" on the screen' do
    assert_selector "button", text: "Desativado"
end

