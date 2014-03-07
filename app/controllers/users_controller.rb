class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    id = params[:id]
    @user = User.find_by_id(id)
  end
end
