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
  pending # express the regexp above with the code you wish you had
end

