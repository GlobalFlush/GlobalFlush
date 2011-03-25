class BathroomsController < ApplicationController

  def index
    @bathrooms = Bathroom.find(:all)
  end

  def show
    @bathroom = Bathroom.find(params[:id])
  end

  
end
