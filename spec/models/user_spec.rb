  require 'spec_helper'

describe User do
  context 'Verifying user attributes' do
    before do
      @user = User.new
    end

    [:name, :username, :email].each do |attribute|
      it "should only be valid with a user #{attribute}" do
        expect(@user).to be_invalid
        expect(@user.errors[attribute]).not_to be_empty
      end
    end
    
  end

  context 'Limited database entries' do
    before do
      valid_data = {
            username: 'SargentBash',
            name: 'Dylan',
            email: 'Sarg@test.com',
            password: '12345678',
            password_confirmation: '12345678'
          }
      @user1 = User.create(valid_data)
      @user2 = User.new(valid_data)
    end

    [:username, :email].each do |attribute|
      it "should have a unique #{attribute}" do
        expect(@user2).to be_invalid
        expect(@user2.errors[attribute]).not_to be_empty
      end
    end
  end
end
