class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/'
  end

  def show
    id = params[:id]
    @photo = Photo.find_by_id(id)
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :description)
  end
end
