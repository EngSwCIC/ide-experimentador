require 'rails_helper'

RSpec.describe 'Visualizing experiments and simulators', type: :feature do
  scenario 'all right' do
    visit simulators_path
    expect(page).to have_content('Simuladores')
    #it {puts page.body}
    # agora vai clicar no href
    # page.should have_link("", :href=>simulators_path(@comment))
    #find_link('ver-experimentos')
    #find(:css, "#ver-experimentos").click
  end
end

describe 'Teste de rota', test_execute: true do     
  it "teste" do
     puts page.body
  end 
end