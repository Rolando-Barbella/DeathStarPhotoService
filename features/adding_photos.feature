Feature: Adding the photos

Scenario: Submitting a photo
  Given I am on the addphotopage
  And I select a photo
  And I fill in the "photo_description" field
  When I press "Upload"
  Then my photo should be added to the DB


