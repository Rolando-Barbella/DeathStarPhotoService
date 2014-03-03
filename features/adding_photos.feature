Feature: Adding the photos

Scenario: Submitting a photo
  Given i am on the addphotopage
  And i select a photo
  And i filling a description
  And press submit
  Then my photo should be added to the DB


