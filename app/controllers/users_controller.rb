class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :feed, :liked_photos, :discover]

  def show
    @user = User.find_by(username: params[:username])

    if @user.nil?
      redirect_to root_path, alert: "User not found"
      return
    end

    @follower_count = @user.received_follow_requests.where(status: "accepted").count
    @following_count = @user.sent_follow_requests.where(status: "accepted").count
    @pending_requests = @user.received_follow_requests.where(status: "pending")
    @photos = @user.photos
  end

  def feed
    @user = User.find_by(username: params[:username])
    redirect_to root_path unless @user
  end

  def liked_photos
    @user = User.find_by(username: params[:username])
    redirect_to root_path unless @user
  end

  def discover
    @user = User.find_by(username: params[:username])
    redirect_to root_path unless @user
  end
end
