Feature: View speed data
    As a user I want to be able to view speed data from the test run

@javascript
Scenario: Test not run (Sad)
    Given that the user is on a experiment screen
    And the test was never run
    When I click on the speed button
    Then it shouldn't be possible to view the data

@javascript
Scenario: Test completed successfully (Happy)
    Given that the user is on a experiment screen
    And the test was run successfully
    When I click on the speed button
    Then I should see in a graph the speed information that was collected during the test run

@javascript
Scenario: Test completed with failure (Sad)
    Given that the user is on a experiment screen
    And the test ran successfully but with a failure
    When I click on the speed button
    Then I should see the speed information until the point of failure

@javascript
Scenario: Data collection failed (Sad)
    Given that the user is on a experiment screen
    And that the test was run but the speed information is missing
    When I click on the speed button
    Then the application should report an error
