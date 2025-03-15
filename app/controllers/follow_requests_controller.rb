class FollowRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    recipient = User.find_by(id: params[:recipient_id])

    if recipient.nil?
      redirect_to "/users", alert: "User not found."
      return
    end

    existing_request = FollowRequest.find_by(sender: current_user, recipient: recipient)

    if existing_request
      redirect_to "/users", alert: "Follow request already exists."
      return
    end

    follow_request = FollowRequest.new(sender: current_user, recipient: recipient, status: "pending")

    if follow_request.save
      redirect_to "/users", notice: "Follow request sent."
    else
      redirect_to "/users", alert: "Failed to send follow request."
    end
  end

  def destroy
    follow_request = FollowRequest.find_by(id: params[:id])

    if follow_request.nil?
      redirect_to "/users", alert: "Follow request not found."
      return
    end

    if follow_request.sender == current_user || follow_request.recipient == current_user
      follow_request.destroy
      redirect_to "/users", notice: "Follow request removed."
    else
      redirect_to "/users", alert: "Unauthorized action."
    end
  end
end
