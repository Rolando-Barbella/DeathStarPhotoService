class WelcomeController < ApplicationController
  def home
    @photos = Photo.all.reverse
  end
end
