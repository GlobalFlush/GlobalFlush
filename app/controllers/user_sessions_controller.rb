# User sessions controller
# It handles the CRUD of all sessions
class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  # GET /login
  # The login page
  def new
  end

  # POST /users
  # Create a new user session for the incoming user data
  # return back to the previous requested url if log in successfully
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default root_url
    else
      render :action => :new
    end
  end

  # DELETE /logout
  # Destroy the current user session
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default login_url
  end
end
