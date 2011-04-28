# Comment Controller
class CommentsController < ApplicationController
  before_filter :require_user

  # GET /comments
  # Redirect user back or to the homepage
  def index
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

  # POST /bathrooms/1
  # Create a new post based on input and current user id.
  # Return user to previous page.
  def create
    @rating          = Rating.new(:bathroom_id => params[:comment][:bathroom_id], :smell => params[:comment][:smell], :clean => params[:comment][:clean], :overall => params[:comment][:overall])
    @comment         = Comment.new(:bathroom_id => params[:comment][:bathroom_id],  :body => params[:comment][:body], :rating_id => @rating.id)

    @comment.user_id = @current_user.id
    if @comment.save and @rating.save
#      redirect_to "bathroom" << @comment.bathroom_id
      redirect_to :back
    else
      flash[:notice] = "Comment body cannot be empty, OR, rating cannot be empty"
      redirect_to :back
    end
  end
end