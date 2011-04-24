class PhotosController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :destroy]
  protect_from_forgery :except => [:destroy]

  # GET /graffiti_photos/:graffiti_id
  # shows all photos of the graffiti with the passing graffiti_id
  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    if !params[:graffiti_id].nil? then
      @graffiti = Graffiti.find(params[:graffiti_id])
    elsif !params[:bathroom_id].nil? then
      @bathroom = Bathroom.find(params[:bathroom_id])
    end

  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = "Photo has been added"
      if(@photo.imageable_type == 'bathroom') then
        redirect_to bathroom_path(@photo.imageable_id)
      else
        redirect_to graffiti_path(@photo.imageable_id)
      end
    else
      render :new
    end
  end

  def index
    if !params[:graffiti_id].nil? then
      @photos = Photo.where("imageable_id = ? AND imageable_type = 'graffiti'",params[:graffiti_id])
    elsif !params[:bathroom_id].nil? then
      @photos = Photo.where("imageable_id = ? AND imageable_type = 'bathroom'",params[:bathroom_id])
    else
      @photos = Photo.find(:all)
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_index_path }
      format.xml  { head :ok }
    end
  end
end