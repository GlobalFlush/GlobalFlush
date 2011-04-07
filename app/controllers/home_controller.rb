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
