Feature: Live updating of the timeline

Background:
  Given I am a user

Scenario: Uploading a photo
  When I am signed in
  When I upload a photo
  Then it should be sent to Pusher
