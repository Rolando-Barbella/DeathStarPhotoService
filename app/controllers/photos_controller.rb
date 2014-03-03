class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/'
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
    params.require(:photo).permit(:description)
  end
end
