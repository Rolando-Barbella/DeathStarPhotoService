Feature: Seeing the user profile

Scenario: Editing my profile
  Given I am signed in
  And I visit my profile page
  Then I should see "edit profile" button
