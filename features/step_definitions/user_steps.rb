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

Given(/^I enter an existing username$/) do
  fill_in :user_username, with: username
  fill_in :user_name, with: name
  fill_in :user_location, with: location
  fill_in :user_password, with: password
  fill_in :user_password_confirmation, with: password
  fill_in :user_email, with: 'solo@Univer.se'
end

Then(/^I should see the username error message$/) do
  expect(page).to have_content('Username has already been taken')
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

Given(/^I visit my profile page$/) do
  visit '/users/:id'
end

Then(/^I should see "(.*?)" button$/) do |arg1|
  expect(page).to have_content('edit profile')
  # expect(page).to have_selector('input', value: 'edit profile')
end

Given(/^the user has uploaded some photos$/) do
  step %Q{there is a photo in the database}
end

Given(/^I am on their page$/) do
user = User.create!(username: 'user_2',
                    name: 'bob',
                    location: 'gagnamland',
                    email: 'bob@gagnamland.com',
                    password: 'hellothere1',
                    password_confirmation: 'hellothere1'
                  )
id = user.id
visit '/users/id'
end

Then(/^I should see their photos$/) do

end

Given(/^the user has not uploaded any photos$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should message "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
