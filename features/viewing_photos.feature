Feature: Viewing Photos

Background:
  Given there are photos in the database

Scenario: Viewing the homepage
  Given I am on the homepage
  Then I should see the photos
  And I should see their description

@wip
Scenario: Viewing individual photos
  Given I am on the individual photo page
  Then I should see the photo
  And the username
  And the comments
  And the description
