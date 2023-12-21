Feature: Create a new local plan

  As a user, I want to be able to create a new execution plan
  @javascript
  Scenario: Test creating a new valid plan
    Given that I am logged in
    And there is a robot with id = "999"
    And I am creating a local plan for the robot "999"
    When I click “Create a local plan”
    And fill in all the information
    And click "Confirm"
    Then there should be LocalPlanSteps with robot_id: "999"
  @javascript
  Scenario: Test creating a new invalid plan
    Given that I am logged in
    And there is a robot with id = "999"
    And I am creating a local plan for the robot "999"
    When I click “Create a local plan”
    And don't fill in all the information for the robot
    And click "Confirm"
    Then there shouldn't be LocalPlanSteps with robot_id: "999"
  @javascript
  Scenario: Test cancelling the creation of a new valid plan
    Given that I am logged in
    And there's an experiment with a robot, with id = "999"
    And I am on the "editing robot" page for a robot with id "999"
    When I click “Create a local plan”
    And fill in all the information
    And click "Cancel"
    And there shouldn't be LocalPlanSteps with robot_id: "999"
