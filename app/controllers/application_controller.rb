# Application Controller
# It contains all global methods that are going to be used in everywhere of the application
# Also contains filters to check status of the current user
# And start up functions to the reset the default setting of the application
class ApplicationController < ActionController::Base
  layout "globalflush"

  protect_from_forgery

  helper_method :current_user_session, :current_user

  before_filter :mailer_set_url_options

  # Reset the action mailer host url
  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  private
  # Return the current user session
  def current_user_session
    logger.debug "ApplicationController::current_user_session"
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  # Return the current logged in user
  # Return nil if there isn't any
  def current_user
    logger.debug "ApplicationController::current_user"
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  # Check if there is user logged in.
  # Return true if there is. Otherwise return false and redirect back to login page.
  def require_user
    logger.debug "ApplicationController::require_user"
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
      return false
    end
  end

  # Check if there is user logged in.
  # Return false if there is and redirect back to homepage. Otherwise return true.
  def require_no_user
    logger.debug "ApplicationController::require_no_user"
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_url
      return false
    end
  end

  # Save the request from client into session
  def store_location
    session[:return_to] = request.request_uri
  end

  # Redirect back to the previous requested url if there is one in the session.
  # Else, return back to homepage
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  # Return the admin status of the current user
  # if the user is not log in, return false
  def is_admin
    if current_user
      return current_user.admin
    end
    return false
  end
  
end
