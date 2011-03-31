class BathroomsController < ApplicationController

  def new
    @bathroom = Bathroom.new
  end

  def create
    @bathroom = Bathroom.new(params[:bathroom])
    @bathroom.build_address(params[:address])
    @bathroom.bathroom_specs.build(params[:bathroom_specs])
    @bathroom.bathroom_photos.build(params[:bathroom_photos])

    if @bathroom.save
      flash[:notice] = "Bathroom created!"
      redirect_to bathroom_path(@bathroom.id)
    else
      render :new
    end
  end
  
  def index
    @bathrooms = Bathroom.find(:all)
  end

  def show
    @bathroom = Bathroom.find(params[:id])
  end

  
end
