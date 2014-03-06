class PhotosController < ApplicationController
  def new
    redirect_to '/' unless user_signed_in?
    @photo = Photo.new
  end

  def create
    photo = Photo.new(photo_params)
    if photo.save
      Pusher['the_force'].trigger('new_photo', {
        url: photo.image.url(:medium),
        description: photo.description,
        id: photo.id
      })
    end
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
