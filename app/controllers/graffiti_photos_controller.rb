# Graffiti Photo Controller
# Manage the CRD of graffiti photos
# log in is only required for new create and destroy action
class GraffitiPhotosController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :destroy]
  protect_from_forgery :except => [:destroy]

  # GET /graffiti_photos/:graffiti_id
  # shows all photos of the graffiti with the passing graffiti_id
  def show
    @graffiti = Graffiti.find(params[:graffiti_id])
    @graffiti_photos = GraffitiPhoto.find_all_by_graffiti_id(params[:graffiti_id])
  end

  # GET /graffiti_photos/new/:graffiti_id
  # new page for adding new photos for the graffiti with the passing graffiti_id
  def new
    @graffiti = Graffiti.find(params[:graffiti_id])
    @graffiti_photo = GraffitiPhoto.new
  end

  # POST /graffiti_photos/:graffiti_id
  # create the new graffiti photo and pass the graffiti_id as well
  def create
    @graffiti_photo = GraffitiPhoto.new(params[:graffiti_photo])
    if @graffiti_photo.save
      flash[:notice] = "Graffiti photo is added!"
      redirect_to graffiti_url(@graffiti_photo.graffiti_id)
    else
      render :new
    end
  end

  # DELETE /graffiti_photos/:id
  # this is passing the graffiti_photo.id (be careful)
  # it destroy that photo and redirect back to the photo show page
  def destroy
    @graffiti_photo = GraffitiPhoto.find(params[:id])
    graffiti_id = @graffiti_photo.graffiti_id
    @graffiti_photo.destroy

    respond_to do |format|
      format.html { redirect_to(graffiti_photo_url(graffiti_id)) }
      format.xml  { head :ok }
    end
    
  end
  
end
