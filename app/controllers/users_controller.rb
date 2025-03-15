class UsersController < ApplicationController
  def feed
    @user = User.find_by(username: params[:username])

    if @user.nil?
      redirect_to root_path, alert: "User not found"
      return
    end

    # Get users that the current user follows
    following_users = User.joins(:received_follow_requests)
                          .where(follow_requests: { sender_id: @user.id, status: "accepted" })

    # Get photos from the followed users
    @photos = Photo.where(owner_id: following_users)

    render "feed"
  end

  def index
    @users = User.all
    @sent_follow_requests = current_user&.sent_follow_requests
  end
end
