Feature: User sign up
  Signing up as a user. Implemented using devise

  Scenario: Input correct credentials
    Given I am on the sign up page
    And I enter valid details
    When I press "Sign up"
    Then I should be added as a stormtrooper
