# Home controller
# It contains the root of this application, the homepage
# And a static link 'about' page of the application
class HomeController < ApplicationController

  # GET /
  # Root of this application, the index page
  def index
    @bathrooms = Bathroom.find(:all)
  end

  # GET /home/about
  # This is the about page
  def about
  end

end
