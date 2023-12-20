require 'rails_helper'

RSpec.describe 'Visualizing experiments and simulators', type: :feature do
  scenario 'all right' do
    visit simulators_path # Acessa a página de simuladores
    expect(page).to have_content('Simuladores') # Verifica se a página renderizada é a correta
  end
end

RSpec.describe 'Creating a new simulator (Happy Path)', type: :feature do
  fixtures :simulators
  scenario 'creating (happy path)' do
    @simulator = simulators(:one) # Carrega um simulador da fixture
    visit simulators_path # Acessa a página de simuladores
    click_on 'Criar Simulador' # Clica no botão de criar simulador
    fill_in 'Nome do Simulador:', with: 'Simulador 1' # Preenche o campo de nome do simulador
    click_on 'Registrar' # Clica no botão de registrar
    expect(page).to have_content(@simulator.name) # Verifica se o nome do simulador foi criado
  end
end

RSpec.describe 'Creating a new simulator (Sad Path)', type: :feature do
  fixtures :simulators
  scenario 'creating (sad path)' do
    @simulator = simulators(:one) # Carrega um simulador da fixture
    visit simulators_path # Acessa a página de simuladores
    click_on 'Criar Simulador' # Clica no botão de criar simulador
    fill_in 'Nome do Simulador:', with: '' # Preenche com um campo vazio
    click_on 'Registrar' # Clica no botão de registrar
    expect(page).to have_content("Erro ao cadastrar simulador!") # Verifica que deu erro ao cadastras
  end
end

RSpec.describe 'Deleting a simulator', type: :feature do
  fixtures :simulators
  scenario 'deleting' do
    @simulator = simulators(:one) # Carrega um simulador da fixture
    visit simulators_path # Acessa a página de simuladores
    click_on 'Deletar Simulador', match: :first # Clica no botão de deletar simulador
    expect(page).to have_content("Simulador deletado com sucesso!") # Verifica se deletou com sucesso
  end
end

RSpec.describe 'Deactivating a Simulator', type: :feature do
  fixtures :simulators
  before(:all) { Simulator.create!(name: "Simulator Name", disabled: false) }
  scenario 'deactivating a simulator' do
    visit simulators_path
    click_on 'Ativado', match: :first # Clica no botão de deletar simulador
    expect(page).to have_content("Desativado") # Verifica se deletou com sucesso
  end
end
