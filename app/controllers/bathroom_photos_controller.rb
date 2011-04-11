# Bathroom Photo Controller
# Manage the CRD of bathroom photos
# log in is only required for new create and destroy action
class BathroomPhotosController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :destroy]
  protect_from_forgery :except => [:destroy]

  # GET /bathroom_photos/:bathroom_id
  # shows all photos of the bathroom with the passing bathroom_id
  def show
    @bathroom = Bathroom.find(params[:bathroom_id])
    @bathroom_photos = BathroomPhoto.find_all_by_bathroom_id(params[:bathroom_id])
  end

  # GET /bathroom_photos/new/:bathroom_id
  # new page for adding new photos for the bathroom with the passing bathroom_id
  def new
    @bathroom = Bathroom.find(params[:bathroom_id])
    @bathroom_photo = BathroomPhoto.new
  end

  # POST /bathroom_photos/:bathroom_id
  # create the new bathroom photo and pass the bathroom_id as well
  def create
    @bathroom_photo = BathroomPhoto.new(params[:bathroom_photo])
    if @bathroom_photo.save
      flash[:notice] = "Bathroom photo is added!"
      redirect_to bathroom_url(@bathroom_photo.bathroom_id)
    else
      render :new
    end
  end

  # DELETE /bathroom_photos/:id
  # this is passing the bathroom_photo.id (be careful)
  # it destroy that photo and redirect back to the photo show page
  def destroy
    @bathroom_photo = BathroomPhoto.find(params[:id])
    bathroom_id = @bathroom_photo.bathroom_id
    @bathroom_photo.destroy

    respond_to do |format|
      format.html { redirect_to(bathroom_photo_url(bathroom_id)) }
      format.xml  { head :ok }
    end
    
  end
  
end
