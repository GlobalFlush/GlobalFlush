class PhotosController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :destroy]
  before_filter :is_admin, :only => :destroy
  protect_from_forgery :except => [:destroy]

  # GET /graffiti_photos/:graffiti_id
  # shows all photos of the graffiti with the passing graffiti_id
  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    if !params[:graffiti_id].nil? then
      @obj = Graffiti.find(params[:graffiti_id])
    elsif !params[:bathroom_id].nil? then
      @obj = Bathroom.find(params[:bathroom_id])
    else
      @obj.name = 'Unattached'
    end

  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = "Photo has been added"
      if(@photo.imageable_type == 'Bathroom') then
        redirect_to bathroom_path(@photo.imageable_id)
      else
        redirect_to polymorphic_path([@photo.imageable.bathroom,@photo.imageable])
      end
    else
      render :new
    end
  end

  def index
    if !params[:graffiti_id].nil? then
      @obj = Graffiti.find(params[:graffiti_id])
      @photos = Photo.where("imageable_id = ? AND imageable_type = 'Graffiti'",params[:graffiti_id])
    elsif !params[:bathroom_id].nil? then
      @photos = Photo.where("imageable_id = ? AND imageable_type = 'Bathroom'",params[:bathroom_id])
      @obj = Bathroom.find(params[:bathroom_id])
    else
      @photos = Photo.find(:all)
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to polymorphic_path([@photo.imageable,:photos]) }
      format.xml  { head :ok }
    end
  end
end