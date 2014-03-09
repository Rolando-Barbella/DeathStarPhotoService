photo_description_text = 'this is programming cat'
require 'awesome_print'

Then(/^my photo should be added to the DB$/) do
  photo = Photo.find_by_description photo_description_text
  expect(photo).to be_true
end

Given(/^there is a photo in the database$/) do
  step %Q{I am a user}
  step %Q{I am signed in}
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
  page.find(:css, 'article img').click
end

When(/^I upload a photo$/) do
  step %Q{I am on the addphotopage}
  step %Q{I select a photo}
  step %Q{I fill in the "photo_description" field}
end

When(/^a photo is uploaded$/) do
  Pusher.url = 'http://58cfbb27046afbc265f1:0c36cbbdafd0cab1404e@api.pusherapp.com/apps/67767'
  Pusher['the_force'].trigger('new_photo', {
        url: 'test.jpg',
        description: photo_description_text
      })
end

Then(/^it should be sent to Pusher$/) do
  allow(Pusher['the_force']).to receive(:trigger)
  step %Q{I press "Upload"}
end

Then(/^my photo should not be added to the DB$/) do
  expect(Photo.all.length).to eq(0)
end

Then(/^the comments$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the description$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the username of the user it belongs to$/) do
  expect(page).to have_content('MrBig')
end
