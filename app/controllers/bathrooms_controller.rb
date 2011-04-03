class BathroomsController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :update, :edit, :destroy]

  def new
  end

  def create
    @bathroom = Bathroom.new(params[:bathroom])
    @bathroom.build_address(params[:bathroom][:address])
    if params[:bathroom][:bathroom_specs]
      @bathroom.bathroom_specs.build(params[:bathroom][:bathroom_specs])
    end
    if params[:bathroom][:bathroom_photos]
      @bathroom.bathroom_photos.build(params[:bathroom][:bathroom_photos])
    end
    
    @bathroom.title = "#{params[:bathroom][:title]} - #{@bathroom.address.inside_location} - #{@bathroom.gender.to_s}"
    if @bathroom.save
      flash[:notice] = "Bathroom created!"
      redirect_to bathroom_path(@bathroom.id)
    else
      render :new
    end
  end
  
  def index
    @bathrooms = Bathroom.find(:all,:order => 'updated_at DESC')
  end

  def show
    @bathroom = Bathroom.find(params[:id])
  end

  def edit
    @bathroom = Bathroom.find(params[:id])
  end

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
