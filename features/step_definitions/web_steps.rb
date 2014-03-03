photo_description_text = 'this is programming cat'

Given(/^i am on the addphotopage$/) do
  visit '/photos/new'
end

Given(/^I am on the sign up page$/) do
  visit '/users/new'
end

Given(/^i select a photo$/) do
  attach_file('photo_image', 'features/test.jpg')
end

Given(/^i filling a description$/) do
  fill_in 'photo_description', with: photo_description_text
end

Given(/^press submit$/) do
  click_button 'upload'
end

When(/^I press submit$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^my photo should be added to the DB$/) do
  photo = Photo.find_by_description photo_description_text
  expect(photo).to be_true
end

Given(/^there is a photo in the database$/) do
  visit '/photos/new'
  attach_file('photo_image', 'features/test.jpg')
  fill_in 'photo_description', with: photo_description_text
  click_button 'upload'
end

Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see the photo$/) do
  element = page.first(:css, 'img')
  src = element[:src]
  expect(src).to match(/test.jpg/)
end

Then(/^I should see their description$/) do
  expect(page).to have_content(photo_description_text)
end

Given(/^I am on the individual photo page$/) do
  visit '/'
  page.find(:xpath, '//img').click
end

Then(/^the username$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the comments$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the description$/) do
  pending # express the regexp above with the code you wish you had
end


