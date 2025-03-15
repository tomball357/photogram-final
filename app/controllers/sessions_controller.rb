class SessionsController < Devise::SessionsController
  def destroy
    super
    flash[:notice] = "Signed out successfully."
  end
end
