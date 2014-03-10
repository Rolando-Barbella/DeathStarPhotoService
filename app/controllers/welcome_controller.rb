class WelcomeController < ApplicationController
  def home
    @photos = Photo.all.reverse
    @user = current_user
  end
end
