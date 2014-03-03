class WelcomeController < ApplicationController
  def home
    @photos = Photo.all
  end
end
