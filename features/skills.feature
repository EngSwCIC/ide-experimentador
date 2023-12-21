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
Scenario: Robot without skills 
    Given that a robot is selected for skills data visualization,
    And this robot has no skills assigned,
    Then the interface should indicate that there are no skills available for the robot.

@javascript
Scenario: Navigation
    Given that there is a local plan with the 'navigation' skill,
    And the 'parameter' field is filled in with the room and the destination waypoints,
    And the "skill" field, within the "local_plan" field, must be filled in with "navigation"
    Then the robot must navigate towards the location.

@javascript
Scenario: Wait Message
    Given that message is being sent,
    And the status of the message should, if successful, be received,
    Then the interface should indicate that the message was sent.

@javascript
Scenario: Send Message
    Given that robot approached nurse,
    And it must send a message to the person in question,
    And the 'skill' field in 'local_plan' must be filled in with 'send_message',
    Then the message must being sent.
