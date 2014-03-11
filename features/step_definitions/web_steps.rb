
# Navigation step
Given(/^I am on the addphotopage$/) do
  visit '/photos/new'
end

Then(/^I should be redirected to the homepage$/) do
  expect(page).to have_css('#photo-stream')
end

Given(/^I am on the homepage$/) do
  visit '/'
end

Given(/^I am on the sign up page$/) do
  visit '/users/sign_up'
end

Then(/^I should be on the edit profile page$/) do
  visit '/users/edit'
end

# Form completion
Given(/^I select a photo$/) do
  attach_file('photo_image', 'features/test.jpg')
end

Given(/^I fill in the "(.*?)" field$/) do |field|
  fill_in field, with: 'this is programming cat'
end

Given(/^I fill in the photoprice field$/) do
  fill_in 'photo_price', with: 500
end

# Pressing and clicking
When(/^I press "([^\"]+)"$/) do |button|
  click_button button
end

When(/^I click "(.*?)"$/) do |link|
  click_link link
end
