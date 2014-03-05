Feature: Live updating of the timeline

Scenario: Uploading a photo
  When I upload a photo
  Then it should be sent to Pusher

@wip
Scenario: Sending a photo
  Given I am on homepage
  And a new photo is uploaded
  Then I should see the photo
  And I should see its description
