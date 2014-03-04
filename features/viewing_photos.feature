Feature: Viewing Photos

Background:
  Given there is a photo in the database

Scenario: Viewing the homepage
  Given I am on the homepage
  Then I should see the photo
  And I should see its description

@wip
Scenario: Viewing individual photos
  Given I am on the individual photo page
  Then I should see the photo
  And the username
  And the comments
  And the description
