class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new(photo_id: params[:photo_id], fan_id: current_user.id)
  
    if @like.save
      redirect_to "/photos/#{@like.photo_id}", notice: "Photo liked!"
    else
      redirect_to "/photos/#{@like.photo_id}", alert: "Failed to like photo."
    end
  end

  def destroy
    @like = Like.find_by(photo_id: params[:photo_id], fan_id: current_user.id)
  
    if @like
      @like.destroy
      redirect_to "/photos/#{params[:photo_id]}", alert: "You unliked this photo."
    else
      redirect_to "/photos/#{params[:photo_id]}", alert: "Could not unlike photo."
    end
  end
end
