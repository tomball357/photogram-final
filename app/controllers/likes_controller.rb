class LikesController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.likes.create!(fan: current_user)
    redirect_to @photo, notice: "You liked this photo."
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.fan == current_user
      @like.destroy
      redirect_to @like.photo, alert: "You unliked this photo."
    else
      redirect_to @like.photo, alert: "Unauthorized action."
    end
  end
end
