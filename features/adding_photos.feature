Feature: Adding the photos

Background:
  Given I am a user

Scenario: Submitting a photo when signed in
  Given I am signed in
  And I am on the addphotopage
  And I select a photo
  And I fill in the "photo_description" field
  When I press "Upload"
  Then my photo should be added to the DB

Scenario: Sumbitting a photo when not signed in
  Given I am on the homepage
  Then I shouldn't see the add new photo link

@wip
Scenario: Visiting add photo page not signed in
  When I visit the addphotopage
  Then I should be redirected to the homepage

@wip
Scenario: Submitting a photo without all the details
  Given I am signed in
  And I am on the addphotopage
  When I press upload
  Then I should see please enter details
  And my photo should not be added to the DB
