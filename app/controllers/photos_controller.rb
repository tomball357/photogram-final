class PhotosController < ApplicationController

  skip_before_action(:authenticate_user!, { :only => [:index] })

  def index
    @photos = Photo.includes(:owner).all
  end
  

  def create
    @photo = Photo.new(photo_params)
    @photo.owner = current_user
  
    if @photo.save
      redirect_to "/photos", notice: "Photo added successfully."
    else
      redirect_to "/photos", alert: "Failed to upload photo."
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :caption)
  end

  def destroy
    @photo = Photo.find(params[:id])

    if @photo.owner == current_user
      @photo.destroy
      redirect_to photos_path, notice: "Photo deleted successfully."
    else
      redirect_to photos_path, alert: "You are not authorized to delete this photo."
    end
  end
end
