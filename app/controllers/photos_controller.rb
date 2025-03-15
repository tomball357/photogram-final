class PhotosController < ApplicationController

  skip_before_action(:authenticate_user!, { :only => [:index] })

  def create
    @photo = current_user.photos.build(photo_params)

    if @photo.save
      redirect_to photos_path, notice: "Photo added successfully."
    else
      render :new, alert: "Failed to add photo."
    end
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
