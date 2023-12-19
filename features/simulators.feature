Feature: Simulator
    @javascript

    Scenario: should destroy simulator
        Given that I am on the settings page
        When I click on the "Criar Simulador" button
        And add "simulator"
        And click "Registrar"
        When I click on the "Deletar Simulador" button
        Then I should see "Simulador deletado com sucesso!"
    
    Scenario: visit index
        Given that I am on the settings page
        Then I should see "Configuração do Ambiente"
    
    Scenario: should create simulator
        Given that I am on the settings page
        When I click on the "Criar Simulador" button
        And add "simulator"
        And click "Registrar"
        Then I should see "Simulador criado com sucesso!" on the screen
    
    Scenario: list all experiments
        Given that I am on the settings page
        When I click on the "Criar Simulador" button
        And add "simulator"
        And click "Registrar"
        When I click on the "Ver Experimentos" button
        Then I should see "Experimentos do simulator" on the screen

    


