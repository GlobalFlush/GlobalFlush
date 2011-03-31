class BathroomsController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :update, :edit, :destroy]

  def new
    @bathroom = Bathroom.new
  end

  def create
    @bathroom = Bathroom.new(params[:bathroom])
    @bathroom.build_address(params[:address])
    @bathroom.bathroom_specs.build(params[:bathroom_specs])
    @bathroom.bathroom_photos.build(params[:bathroom_photos])
    @bathroom.title = "#{params[:bathroom][:title]} - #{@bathroom.address.inside_location} - #{@bathroom.gender.to_s}"
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
