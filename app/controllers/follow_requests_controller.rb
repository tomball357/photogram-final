class FollowRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    recipient = User.find(params[:recipient_id])
    follow_request = current_user.sent_follow_requests.create(recipient: recipient, status: "pending")

    if follow_request.persisted?
      redirect_to users_path, notice: "Follow request sent."
    else
      redirect_to users_path, alert: "Follow request failed."
    end
  end
end
