
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

# Form completion
Given(/^I select a photo$/) do
  attach_file('photo_image', 'features/test.jpg')
end

Given(/^I fill in the "(.*?)" field$/) do |field|
  fill_in field, with: 'this is programming cat'
end

# Pressing and clicking
When(/^I press "([^\"]+)"$/) do |button|
  click_button button
end

