require 'rails_helper'

RSpec.describe 'Visualizing experiments related to a simulator', type: :feature do
  scenario 'show' do
    visit simulators_path # Acessa a página de simuladores
    click_on 'Ver Experimentos', match: :first # Clica no botão de ver experimentos
    expect(page).to have_content('Experimentos do ') # Verifica se a página renderizada é a correta
  end
end
