Feature: View skills data from the test run
    As a user interested in the results of tests performed,
    To understand the skills demonstrated during a test,
    I want to visualize the skills data associated with the robot.

Context:
    Given that I have run a test in the simulator,
    Then I should see the robot's skills in the test run.

@javascript
Scenario: Failure
    Given that the robot has different skills in its local plan,
    And the progress of the plan depends on the success of each skill,
    Then it must be informed which of the robot's skills failed.


@javascript
Scenario: Success
    Given that a robot has a set of skills
    And all skills are executed with success
    Then the interface should show the graph of the skills

@javascript
Scenario: Robot without skills 
    Given that a robot is selected for skills data visualization,
    And this robot has no skills assigned,
    Then the interface should indicate that there are no skills available for the robot.
