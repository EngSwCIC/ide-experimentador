
Feature: Simulator toggle activate
    @javascript

    Scenario: activate toggle
        Given that I am on the settings page
        When I click on the "Criar Simulador" button
        And add "simulator3"
        And click "Registrar"
        When I click on the "Desativado" button
        Then I should see "Ativado" on the screen

 