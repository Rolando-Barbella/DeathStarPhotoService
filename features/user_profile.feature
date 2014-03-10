Feature: Seeing the user profile

Background:
  Given I am a user

Scenario: Editing my profile
  Given I am signed in
  And I am on the homepage
  Then I should see "Edit profile" button
