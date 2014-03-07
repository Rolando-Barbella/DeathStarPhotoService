Feature: Live updating of the timeline

Background:
  Given I am a user

Scenario: Uploading a photo
  When I am signed in
  When I upload a photo
  Then it should be sent to Pusher

# @javascript
# Scenario: Sending a photo
#  Given I am on the homepage
#  Then I should see the photo
#  And I should see its description
#  And I should be able to visit its unique page
