Given 'that I am on the settings page' do
    visit simulators_path
end

Then 'I should see "Configuração do Ambiente"' do
    assert_selector "h1", text: "Configuração do Ambiente"
end

When 'I click on the "Criar Simulador" button' do
    click_on "Criar Simulador"
end

And('add {string}') do |string|
    fill_in "Nome do Simulador:", with: string
end

And 'click "Registrar"' do
    click_on "Registrar"
end

Then 'I should see "Simulador criado com sucesso!" on the screen' do
    assert_selector "div", text: "Simulador criado com sucesso!"
end

When 'I click on the "Deletar Simulador" button' do 
    click_on "Deletar Simulador", match: :first
end

Then 'I should see "Simulador deletado com sucesso!"' do
    assert_selector "div", text: "Simulador deletado com sucesso!"
end

When 'I click on the "Ver Experimentos" button' do
    click_on "Ver Experimentos", match: :first
end

Then 'I should see "Experimentos do simulator" on the screen' do
    assert_selector "h1", text: "Experimentos do simulator"
end

When 'I click on the "Desativado" button' do
    click_on "Desativado", match: :first
end

Then 'I should see "Ativado" on the screen' do
    assert_selector "p", text: "Ativado"
end

When 'I click on the "Ativado" button' do
    click_on "Ativado", match: :first
end

Then 'I should see "Desativado" on the screen' do
    assert_selector "p", text: "Desativado"
end

