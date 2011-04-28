# Graffiti Controller
# Handles CRUD of graffiti
class GraffitiController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :update, :edit, :destroy]

  # GET /graffiti/:bathroom_id
  def new
    @bathroom = Bathroom.find(params[:bathroom_id])
    @graffiti = Graffiti.new
  end

  # POST /graffiti
  def create
    @graffiti = Graffiti.new(params[:graffiti])
    if @graffiti.save
      flash[:notice] = "Graffiti has been added!"
      redirect_to [@graffiti.bathroom,@graffiti]
    else
      render :new
    end
  end

  # GET /graffiti/:bathroom_id
  def index
    if !params[:bathroom_id].nil? then
      @graffiti = Graffiti.where("bathroom_id = ?",params[:bathroom_id])
    else
      @graffiti = Graffiti.find(:all,:order => 'updated_at DESC')
    end
  end

  # GET /graffiti/:id
  def show
    @graffiti = Graffiti.find(params[:id])
  end

  # GET /graffiti/:id
  def edit
    @graffiti = Graffiti.find(params[:id])
  end

  # PUT /graffiti/:id
  def update
    @graffiti = Graffiti.find(params[:id])
    respond_to do |format|
      if @graffiti.update_attributes(params[:graffiti])
        format.html { redirect_to([@graffiti.bathroom,@graffiti], :notice => 'Graffiti was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @graffiti.errors, :status => :unprocessable_entity }
      end
    end

  end
end