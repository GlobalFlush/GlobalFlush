# Home controller
# It contains the root of this application, the homepage
# And a static link 'about' page of the application
class HomeController < ApplicationController

  # GET /
  # Root of this application, the index page
  def index
    @bathrooms = Bathroom.find(:all)
  end

  # GET /home/about
  # This is the about page
  def about
  end

  # for testing purpose: the graffiti page
  def graffiti_test
  end

  # GET /search
  # Search for bathroom by keywords
  # Calling named_scope in Bathroom model
  def search
    
    @bathrooms = Bathroom.search_by_address(params[:keyword])
    @addresses = @bathrooms.map { |b| b.address }
    @ratings = @bathrooms.map { |b| b.ratings }

    @bathrooms_with_address_ratings = @bathrooms.map { |b| [b, b.address, b.ratings] }

    
    respond_to do |format|
      format.html { render }
      format.xml  { render :xml => @bathrooms_with_address_ratings }
      format.json { render :json => @bathrooms_with_address_ratings }
    end
    
  end
  
end
