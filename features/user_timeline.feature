Feature: Visiting user's timeline

@wip
Scenario: When a user has some photos
  Given the user has uploaded some photos
  And I am on their page
  Then I should see their photos

@wip
Scenario: When a user has no photos
  Given the user has not uploaded any photos
  And I am on their page
  Then I should message "user has no photos yet"
