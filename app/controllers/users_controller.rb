# Users Controller
# It contains CRUD actions for users
# Require no user for new and create
# Require user for show edit and update
class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  # GET /users/new
  # GET /register
  # Register page for user
  def new
    @user = User.new
  end

  # POST /users
  # Create a user into the database by using the params
  # Return back to the previous requested url if successful
  # Else shows the errors
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default root_url
    else
      render :action => :new
    end
  end

  # GET /users/show
  # Show the user homepage for the current user
  def show
    @user = @current_user
  end

  # GET /user/edit
  # Edit the user profile (password update)
  def edit
    @user = @current_user
  end

  # PUT /users
  # Update user data by using params passed from client
  # Return back to user homepage if successful
  # Else shows the errors
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to user_url
    else
      render :action => :edit
    end
  end
end