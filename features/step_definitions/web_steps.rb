Given(/^i am on the addphotopage$/) do
  visit '/photos/new'
end

Given(/^i select a photo$/) do
  attach_file('photo_image', 'features/test.jpg')
end

Given(/^i filling a description$/) do
  fill_in 'photo_description', with: 'this is programming cat'
end

Given(/^press submit$/) do
  click_button 'upload'
end

Then(/^my photo should be added to the DB$/) do
  photo = Photo.find_by_description 'this is programming cat'
  expect(photo).to be_true
end

Given(/^there are photos in the database$/) do
  visit '/photos/new'
  attach_file('photo_image', 'features/test.jpg')
  fill_in 'photo_description', with: 'this is programming cat'
  click_button 'upload'
end

Given(/^I am on the homepage$/) do
  visit '/'
end

Then(/^I should see the photos$/) do
  element = page.first(:css, 'img')
  src = element[:src]
  expect(src).to match(/test.jpg/)
end

Then(/^I should see their description$/) do
  expect(page).to have_content('this is programming cat')
end


