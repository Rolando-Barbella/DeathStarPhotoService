photo_description_text = 'this is programming cat'
require 'awesome_print'
Then(/^my photo should be added to the DB$/) do
  photo = Photo.find_by_description photo_description_text
  expect(photo).to be_true
end

Given(/^there is a photo in the database$/) do
  visit '/photos/new'
  attach_file('photo_image', 'features/test.jpg')
  fill_in 'photo_description', with: photo_description_text
  click_button 'Upload'
end

Then(/^I should see the photo$/) do
  element = page.first(:css, '#photo-stream img')
  src = element[:src]
  expect(src).to match(/test.jpg/)
end

Then(/^I should see its description$/) do
  expect(page).to have_content(photo_description_text)
end

Given(/^I am on the individual photo page$/) do
  visit '/'
  page.find(:xpath, '//img').click
end