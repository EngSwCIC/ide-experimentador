Feature: View skills data from the test run
    As a user interested in the results of tests performed,
    To understand the skills demonstrated during a test,
    I want to visualize the skills data associated with the robot.

Scenario: Visualization Panel Skills
    Given that I have run a test in the simulator,
    When I visit the skills visualization panel page,
    Then I should see the robot's skills in the test run.

Scenario: Success
    Given that the robot has different skills in its local plan,
    And the progress of the plan depends on the success of each skill,
    Then it should be informed whether the simulation was successful.

Scenario: Failure
    Given that the robot has different skills in its local plan,
    And the progress of the plan depends on the success of each skill,
    Then it must be informed which of the robot's skills failed.

Scenario: Observation of test execution time
    Given that the user analyzes the test execution logs,
    And observes the time stamp field in each log entry,
    Then the user observes, in addition to success and failure, at what point a skill is changed.

Scenario: Viewing skills without running a simulation
    Given that the user tries to access the skills view without running the simulation,
    Then the interface gives an error message.

Scenario: Robot without skills 
    Given that a robot is selected for skills data visualization,
    And this robot has no skills assigned,
    Then the interface should indicate that there are no skills available for the robot.

Scenario: Skills fields not filled in correctly
    Given that a robot has an associated local plan,
    And the local plan contains incorrect information or skill fields that are not filled in correctly,
    When the user runs a test with this robot,
    And the interface should detect the errors in the skills fields,
    Then prevent/interrupt the test run.

Scenario: Navigation
    Given that there is a local plan with the "navigation" skill,
    And the "parameter" field is filled in with the room and the destination waypoints,
    And the "skill" field, within the "local_plan" field, must be filled in with "navigation"
    Then the robot must navigate towards the location.

Scenario: Approach Person
    Given that the robot has used "navigation",
    And it wants to move towards someone,
    And the "skill" field in "local_plan" should be filled in with "approach_person",
    And the "parameter" field should contain "topic" with the target person,
    Then the robot should approach the target person.

Scenario: Authenticate Person
    Given that the robot has used "approach_person",
    And went to meet a person,
    And it must authenticate the person in question,
    And the "skill" field in the "local_plan" must be filled in with "authenticate_person",
    And the "parameter" field must contain "topic" with the person to be authenticated,
    Then the person must be authenticated.

Scenario: Approach Robot
    Given that the robot must approach an object,
    And the "skill" field in the "local_plan" should be filled with "approach_robot",
    And the "parameter" field must contain "topic" with the approach object,
    Then the robot must approach the object.

Scenario: Operate Drawer
    Given that the robot used "authenticate_person",
    And it must perform an action on the person,
    And the "skill" field in the "local_plan" should be filled with "operate_drawer",
    Then the "parameter" field must contain "action" with "open".

Scenario: Wait Message
    Given that the robot used "operate_drawer",
    And the status of the message should, if successful, be received,
    Then Operate Drawer must contain "action" with "close".

Scenario: Send Message
    Given that there is a local plan,
    And that the robot has used "operate_drawer",
    And it must send a message to the person in question,
    And the "skill" field in "local_plan" must be filled in with "send_message",
    And the "parameter" field must contain "topic" with the person to whom the message is addressed,
    Then the person must receive the message.

# - Example of errors in the Skills fields:
# . The navigation skill has missing or invalid waypoints.
# . The "topic" parameter for the "approach_person" skill is not set.
# . The action for the "operate_drawer" skill does not specify whether it is to open or close the drawer.
# . One or more skills in the local plan are missing essential information.