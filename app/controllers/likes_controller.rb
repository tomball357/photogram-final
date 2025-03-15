class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    photo = Photo.find(params[:photo_id])
    like = Like.new(photo: photo, fan: current_user)

    if like.save
      redirect_to photo_path(photo), notice: "Liked!"
    else
      redirect_to photo_path(photo), alert: "Unable to like photo."
    end
  end

  def destroy
    like = Like.find(params[:id])
    if like.fan == current_user
      like.destroy
      redirect_to photo_path(like.photo), notice: "Unliked!"
    else
      redirect_to photo_path(like.photo), alert: "Unauthorized."
    end
  end
end

