require "application_system_test_case"

class SimulatorsTest < ApplicationSystemTestCase
  setup do
    @simulator = simulators(:one)
  end

  test "visiting the index" do
    visit simulators_path
    assert_selector "h1", text: "Configuração do Ambiente"
  end

  test "should create simulator" do
    visit simulators_path
    click_on "Criar Simulador"

    fill_in "Nome do Simulador:", with: @simulator.name
    click_on "Registrar"
    assert_selector "h1", text: "Configuração do Ambiente"
  end

  # test "should see all experiments related" do
  #   visit simulators_path(@simulator)
  #   click_on "ver-experimentos", match: :first
  #   assert_text "Experimentos do
  #   click_on "Voltar"
  # end

  test "should destroy Simulator" do
    visit simulators_path(@simulator)
    click_on "Deletar Simulador", match: :first
    assert_selector "h1", text: "Configuração do Ambiente"
  end
end
