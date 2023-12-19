require "application_system_test_case"

class SimulatorsTest < ApplicationSystemTestCase
  setup do
    @simulator = simulators(:one)
  end

  test "visiting the index" do
    visit simulators_path # Acessa a página de simuladores
    assert_selector "h1", text: "Configuração do Ambiente" # Verifica se a página renderizada é a correta
  end

  test "should create simulator" do
    visit simulators_path # Acessa a página de simuladores
    click_on "Criar Simulador" # Clica no botão de criar simulador

    fill_in "Nome do Simulador:", with: @simulator.name # Preenche o campo de nome do simulador
    click_on "Registrar" # Clica no botão de registrar
    assert_selector "h1", text: "Configuração do Ambiente" # Verifica se a página renderizada é a correta
  end

  test "should destroy Simulator" do
    visit simulators_path(@simulator) # Acessa a página de simuladores
    click_on "Deletar Simulador", match: :first # Clica no botão de deletar simulador
    assert_selector "h1", text: "Configuração do Ambiente" # Verifica se a página renderizada é a correta
  end
end
