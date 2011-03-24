class HomeController < ApplicationController

  def index
    @bathrooms = Bathroom.find(:all)
  end

end
