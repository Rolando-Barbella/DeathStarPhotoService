require 'spec_helper'

describe Photo do
  context 'Verifying photo details' do
    before do
      @photo = Photo.new
    end

    [:description, :image, :user].each do |attribute|
      it "should be invalid without a photo #{attribute}" do
        expect(@photo).to be_invalid
        expect(@photo.errors[attribute]).not_to be_empty
      end
    end

    
  end
end
