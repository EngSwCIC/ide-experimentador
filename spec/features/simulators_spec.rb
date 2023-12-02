require 'rails_helper'

RSpec.describe 'Visualizing all simulators', type: :feature do
  scenario 'all right' do
    visit simulators_path
    expect(page).to have_content('Simuladores')
  end
end
# RSpec.describe 'Desactivating simulator', type: :feature do
#   scenario 'all right' do
#     visit simulators_path
#     click_on "Ativado"
#     visit toggle_path
#     expect(page).to have_content('Desativado')
#   end
# end
