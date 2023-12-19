require 'rails_helper'



RSpec.describe 'Visualizing experiments and simulators', type: :feature do
  scenario 'all right' do
    visit simulators_path # Acessa a página de simuladores
    expect(page).to have_content('Simuladores') # Verifica se a página renderizada é a correta
  end
end

RSpec.describe 'Creating a new simulator', type: :feature do
  fixtures :simulators
  scenario 'create' do
    @simulator = simulators(:one) # Carrega um simulador da fixture
    visit simulators_path # Acessa a página de simuladores
    click_on 'Criar Simulador' # Clica no botão de criar simulador
    fill_in 'Nome do Simulador:', with: 'Simulador 1' # Preenche o campo de nome do simulador
    click_on 'Registrar' # Clica no botão de registrar
    expect(page).to have_content(@simulator.name) # Verifica se o nome do simulador foi criado
  end
end


RSpec.describe 'Visualizing experiments related to a simulator', type: :feature do
  scenario 'show' do
    visit simulators_path # Acessa a página de simuladores
    click_on 'ver-experimentos' # Clica no botão de ver experimentos
    expect(page).to have_content('Experimentos do ') # Verifica se a página renderizada é a correta
  end
end
