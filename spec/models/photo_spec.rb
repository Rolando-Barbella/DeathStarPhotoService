require 'spec_helper'

describe Photo do
  let(:valid_photo_details) do
    {
      image: File.new('./test.jpg'),
      description: 'photoey',
      price: 500
    }
  end
  let(:valid_user) do
    User.new({
            username: 'SargentBash',
            name: 'Dylan',
            email: 'Sarg@test.com',
            password: '12345678',
            password_confirmation: '12345678'
          })
  end
  let (:invalid_user) { User.new }
  let (:empty_photo) { Photo.new }

  context 'Verifying photo details' do
    [:description, :image, :user, :price].each do |attribute|
      it "should be invalid without a photo #{attribute}" do
        expect(empty_photo).to be_invalid
        expect(empty_photo.errors[attribute]).not_to be_empty
      end
    end
  end

  context 'price information' do
    it 'should not accept a negative price' do
      photo = Photo.new price: -100
      expect(photo).to be_invalid
      expect(photo.errors[:price]).not_to be_empty
    end

    it 'should not accept a decimal price' do
      photo = Photo.new price: 0.11
      expect(photo).to be_invalid
      expect(photo.errors[:price]).not_to be_empty
    end
  end

  context 'Checking existance of photo creator' do
    
    it 'should be invalid when given a none existant user' do
      photo = Photo.new(valid_photo_details)
      expect(photo).to be_invalid
      expect(photo.errors[:user]).not_to be_empty
    end

    it 'should be valid when given an existing user' do
      photo = Photo.new(valid_photo_details.merge({user: valid_user}))
      expect(photo).to be_valid
    end
  end
  context 'Sending upload notification via Pusher' do
    it 'should send a message to pusher if saved' do
      expect(valid_user).to be_valid
      valid_user.save!
      expect(Pusher).to receive(:trigger)
      Photo.save_and_send(valid_photo_details.merge({user_id: valid_user.id}))
    end
  end
end
