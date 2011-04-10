# Bathrooms Controller
# It controls all the pages are related to all the CRUD page for bathrooms
# log in is required for CUD, displaying is not required log in
class BathroomsController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :update, :edit, :destroy]

  # GET /bathrooms/new
  # Bathroom creation page, creates a temporary bathroom object with 1 address, 5 bathroom_specs, and 3 bathroom_photos
  def new
    @bathroom = Bathroom.new
    @bathroom.build_address
    5.times do
      @bathroom.bathroom_specs.build
    end
    3.times do
      @bathroom.bathroom_photos.build
    end
  end

  # POST /bathrooms
  # Bathroom creation action. Create a bathroom by using data passed from params
  # Return to the bathroom page if it creates successfully
  # Else stays on the 'new' page and indicates the errors
  def create
    @bathroom = Bathroom.new(params[:bathroom])
    @bathroom.build_address(params[:bathroom][:address_attributes])
    if params[:bathroom][:bathroom_specs]
      @bathroom.bathroom_specs.build(params[:bathroom][:bathroom_specs])
    end
    if params[:bathroom][:bathroom_photos]
      @bathroom.bathroom_photos.build(params[:bathroom][:bathroom_photos])
    end

    # Temporary method to construct the title
    @bathroom.title = "#{params[:bathroom][:title]} - #{@bathroom.address.inside_location} - #{@bathroom.gender.to_s}"
    if @bathroom.save
      flash[:notice] = "Bathroom created!"
      redirect_to bathroom_path(@bathroom.id)
    else
      render :new
    end
  end

  # GET /bathrooms
  # Index page for bathrooms. Query all bathroom and ordered by descending updated_at time
  def index
    @bathrooms = Bathroom.find(:all,:order => 'updated_at DESC')
  end

  # GET /bathrooms/:id
  # Page for showing a single bathroom. 
  def show
    @bathroom = Bathroom.find(params[:id])
  end

  # GET /bathrooms/:id/edit
  # Page for editing a single bathroom.
  def edit
    @bathroom = Bathroom.find(params[:id])
  end

  # PUT /bathrooms/:id
  # Update the bathroom by the params
  # redirect back to the bathroom page if updates successfully
  def update
    @bathroom = Bathroom.find(params[:id])
    respond_to do |format|
      if @bathroom.update_attributes(params[:bathroom]) #&& @bathroom.address.update_attributes(params[:bathroom][:address])
        format.html { redirect_to(@bathroom, :notice => 'Bathroom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bathroom.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  
end
