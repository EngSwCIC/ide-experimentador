Feature: View speed data
    As a user I want to be able to view speed data from the test run

Context:
    Given that I click on the speed button
    Then I should see the speed data of the executed test

Scenario: Test not run
    Given the test was never run
    Then it shouldn't be possible to view the data

Scenario: Test completed successfully
    Given that the test was run successfully
    Then I should see in a graph the speed information that was collected during the test run

Scenario: Test completed with failure
    Given that the test ran successfully
    Then I should have a visualization of the failure

Scenario: Data collection failed
    Given that the test was run
    And the speed information is missing
    Then the application should report a failure