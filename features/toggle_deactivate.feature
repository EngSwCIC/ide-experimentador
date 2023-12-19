 Feature: Simulator toggle deactivate
    @javascript
    
    Scenario: deactivate toggle
        Given that I am on the settings page
        When I click on the "Criar Simulador" button
        And add "simulator1"
        And click "Registrar"
        When I click on the "Desativado" button
        Then I should see "Ativado" on the screen
        When I click on the "Ativado" button
        Then I should see "Desativado" on the screen