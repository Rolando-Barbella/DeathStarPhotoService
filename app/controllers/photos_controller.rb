class PhotosController < ApplicationController
  def new
    redirect_to '/' unless user_signed_in?
    @photo = Photo.new
    @user = current_user
  end

  def create
    Photo.save_and_send(photo_params.merge(user: current_user))
    redirect_to '/'
  end

  def show
    id = params[:id]
    @photo = Photo.find_by_id(id)
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :description, :price)
  end
end
