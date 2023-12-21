Feature: User interacts with experiment index screen

Context:
Given that I am logged in as the ide-experimenter user

Scenario: User views all experiments on the index screen (Happy)
    Given the user is on the index experiment screen
    Then the user should see all experiments

Scenario: User searches for specific experiments (Happy)
    Given the user is on the index experiment screen
    When the user fills the search bar with "Experiment 1"
    Then the user should see all experiments "Experiment 1"


Scenario: User doesn't fill the search bar (Happy)
    Given the user is on the index experiment screen
    When the user doesn't fill the fields
    Then the user should see all experiments
