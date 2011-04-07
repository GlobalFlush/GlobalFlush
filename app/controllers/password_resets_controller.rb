# Password Reset Controller
# It contains all CRUD pages of for password resets functionality
# Require no user log in for all actions
class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  before_filter :require_no_user

  # GET /password_resets/new
  # The new password reset page
  def new
    render
  end

  # POST /password_resets
  # To find the user by email.
  # Deliver the password reset instructions email if the user is found
  # Else shows the error
  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you. " +
        "Please check your email."
      redirect_to root_url
    else
      flash[:notice] = "No user was found with that email address"
      render :action => :new
    end
  end

  # GET /password_resets/:id/edit
  # Form for reset the password
  def edit
    render
  end

  # PUT /password_resets/:id
  # Update the user password and save it
  # Return back to user homepage if successful
  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Password successfully updated"
      redirect_to user_url
    else
      render :action => :edit
    end
  end

  private
  # Private function
  # Find user by perishable token which is passed from the url
    def load_user_using_perishable_token
      @user = User.find_using_perishable_token(params[:id])
      unless @user
        flash[:notice] = "We're sorry, but we could not locate your account." +
          "If you are having issues try copying and pasting the URL " +
          "from your email into your browser or restarting the " +
          "reset password process."
        redirect_to root_url
      end
    end
end
