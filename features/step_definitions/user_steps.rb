username = 'MrBig'
name = 'Darth Vader'
location = 'Far far away'
password = 'lightsaber'
email = 'Overlord@Univer.se'

Given(/^I enter valid details$/) do
  fill_in :user_username, with: username
  fill_in :user_name, with: name
  fill_in :user_location, with: location
  fill_in :user_password, with: password
  fill_in :user_password_confirmation, with: password
  fill_in :user_email, with: email
end

Given(/^I am a user$/) do
  User.create!(username: username,
               name: name,
               location: location,
               email: email,
               password: password,
               password_confirmation: password
                     )
end

Then(/^I should be added as a stormtrooper$/) do
  user = User.find_by_username(username)
  expect(user.name).to eq(name)
end

Given(/^I am signed in$/) do
  visit '/users/sign_in'
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  click_button 'Sign in'
end

Then(/^I shouldn't see the add new photo link$/) do
  expect(page).not_to have_content('Add Photo')
end
