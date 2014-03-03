username = 'MrBig'
name = 'Darth Vader'
location = 'Far far away'
password = 'lightsaber'
email = 'Overlord@Univer.se'

Given(/^I enter valid details$/) do
  fill_in :username, with: username
  fill_in :name, with: name
  fill_in :location, with: location
  fill_in :password, with: password
  fill_in :password_confirmation, with: password
  fill_in :email, with: email
end

Then(/^I should be added as a stormtrooper$/) do
  pending # express the regexp above with the code you wish you had
end
