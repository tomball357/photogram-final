
class FollowRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    recipient = User.find(params[:recipient_id])
    current_user.sent_follow_requests.create!(recipient: recipient, status: "pending")
    redirect_to users_path, notice: "Follow request sent."
  end

  def destroy
    follow_request = FollowRequest.find(params[:id])
    follow_request.destroy
    redirect_to users_path, notice: "Follow request removed."
  end
end
