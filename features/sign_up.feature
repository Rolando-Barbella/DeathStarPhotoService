Feature: User sign up
  Signing up as a user. Implemented using devise

  Scenario: Input correct credentials
    Given I am on the sign up page
    And I enter valid details
    When I press "Sign up"
    Then I should be added as a stormtrooper

  Scenario: Signing up when username is taken
    Given I am a user
    And I am on the sign up page
    When I enter an existing username
    And I press "Sign up"
    Then I should see the username error message
