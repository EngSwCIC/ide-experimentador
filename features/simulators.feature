Feature: Simulator
    @javascript

    Scenario: visit index
        Given that I am on the settings page
        Then I should see "Configuração do Ambiente" on h1

    Scenario: Create Simulator (Happy Path)
        Given that I am on the settings page
        When I click on the "Criar Simulador" button
        And add "Simulador 1"
        And click "Registrar"
        Then I should see "Simulador criado com sucesso!" on div
    
    Scenario: Create Simulator (Sad Path)
        Given that I am on the settings page
        When I click on the "Criar Simulador" button
        And add ""
        And click "Registrar"
        Then I should see "Erro ao cadastrar simulador!" on div
    
    Scenario: List all experiments related
        Given that I am on the settings page
        When I click on the "Criar Simulador" button
        And add "Simulador 2"
        And click "Registrar"
        When I click on the "Ver Experimentos" button
        Then I should see "Experimentos do Simulador 2" on h1

    Scenario: Deleting experiment
        Given that I am on the settings page
        When I click on the "Criar Simulador" button
        And add "Simulador 3"
        And click "Registrar"
        When I click on the "Deletar Simulador" button
        Then I should see "Simulador deletado com sucesso!" on div
    
    Scenario: Activating toggle
        Given that I am on the settings page
        When I click on the "Criar Simulador" button
        And add "Simulador 4"
        And click "Registrar"
        When I click on the "Desativado" button
        Then I should see "Ativado" on the screen
    
    Scenario: Deactivating toggle
        Given that I am on the settings page
        When I click on the "Criar Simulador" button
        And add "Simulador 5"
        And click "Registrar"
        When I click on the "Desativado" button
        Then I should see "Ativado" on the screen
        When I click on the "Ativado" button
        Then I should see "Desativado" on the screen
    
    

    


