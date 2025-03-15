class UsersController < ApplicationController
  def feed
    @user = User.find_by(username: params[:username])
  
    if @user.nil?
      redirect_to root_path, alert: "User not found"
      return
    end
  
    following_users = User.joins(:received_follow_requests)
                          .where(follow_requests: { sender_id: @user.id, status: "accepted" })
  
    @photos = Photo.where(owner_id: following_users)
  
    render "feed"
  end
  


  def liked_photos
    @user = User.find_by(username: params[:username])
    @liked_photos = Photo.joins(:likes).where(likes: { fan_id: @user.id })
  end

  
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:username])
  
    if @user.nil?
      redirect_to root_path, alert: "User not found"
      return
    end
  
    @followers_count = @user.received_follow_requests.where(status: "accepted").count
    @following_count = @user.sent_follow_requests.where(status: "accepted").count
    @photos = @user.photos
  end

  def discover
    @user = User.find_by(username: params[:username])
  
    following_users = User.joins(:received_follow_requests)
                          .where(follow_requests: { sender_id: @user.id, status: "accepted" })
  
    @discover_photos = Photo.joins(:likes).where(likes: { fan_id: following_users })
  end
  
  
  
end
