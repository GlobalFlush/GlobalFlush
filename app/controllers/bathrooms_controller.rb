class BathroomsController < ApplicationController
  def show
    @bathroom = Bathroom.find(params[:id])
    
  end

  
end
