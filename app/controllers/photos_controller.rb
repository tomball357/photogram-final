class PhotosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @photos = Photo.all
  end
end
