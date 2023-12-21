Feature: User interacts with experiment index screen

Context:
Given that I am logged in as the ide-experimenter user

@javascript
Scenario: User views all experiments on the index screen (Happy)
    Given the user is on the index experiment screen
    Then the user should see all experiments

@javascript
Scenario: User searches for specific experiments (Happy)
    Given the user is on the index experiment screen
    When the user fills the search bar with "Specific Experiment"
    Then the user should see all experiments "Specific Experiment"

@javascript
Scenario: User doesn't fill the search bar (Happy)
    Given the user is on the index experiment screen
    And the user doesn't fill the fields
    Then the user should see all experiments
