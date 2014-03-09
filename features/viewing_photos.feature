Feature: Viewing Photos

Background:
  Given there is a photo in the database

Scenario: Viewing the homepage
  Given I am on the homepage
  Then I should see the photo
  And I should see its description
  And the username of the user it belongs to

@wip
Scenario: Viewing individual photos
  Given I am on the individual photo page
  Then I should see its description
  And the username of the user it belongs to
  And the comments
