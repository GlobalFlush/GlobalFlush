class BathroomsController < ApplicationController

  def new
    @bathroom = Bathroom.new
  end

  def create

  end
  
  def index
    @bathrooms = Bathroom.find(:all)
  end

  def show
    @bathroom = Bathroom.find(params[:id])
  end

  
end
