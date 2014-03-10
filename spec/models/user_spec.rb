  require 'spec_helper'

describe User do
  let(:valid_data) {
    {
      username: 'SargentBash',
      name: 'Dylan',
      email: 'Sarg@test.com',
      password: '12345678',
      password_confirmation: '12345678'
    }
  }
  context 'Verifying user attributes' do
    before do
      @user = User.new
    end

    [:name, :username, :email].each do |attribute|
      it "should be invalid without a user #{attribute}" do
        expect(@user).to be_invalid
        expect(@user.errors[attribute]).not_to be_empty
      end
    end
    
  end

  context 'Usernames have limited values' do |variable|
    ["Sargent Bash", "SargentBashTheBiggestAndBaddest", "SB", "$£*()"].each do |username|
      it "should be invalid with username #{username}" do
        invalid_data = valid_data.merge({username: username})
        user = User.new(invalid_data)
        expect(user).to be_invalid
      end
    end
  end

  context 'Limited database entries' do
    before do
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
