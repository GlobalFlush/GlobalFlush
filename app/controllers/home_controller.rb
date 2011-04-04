class HomeController < ApplicationController

  def index
    @bathrooms = Bathroom.find(:all)
  end

  def about
    # this is the about page
  end

end
