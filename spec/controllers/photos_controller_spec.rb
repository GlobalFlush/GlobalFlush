require 'spec_helper'

describe PhotosController do

  def mock_photo(stubs={})
    @mock_photo ||= mock_model(Photo, stubs).as_null_object
  end

  describe "GET index" do
    it "redirects to the bathrooms list" do
      Photo.stub(:find) { mock_photo }
      get :index, :id => "1"
      response.should redirect_to(photo_url)
    end
  end

  describe "GET show" do
    it "assigns the requested photo as @photo" do
      Photo.stub(:find).with("37") { mock_photo }
      get :show, :id => "37"
      assigns(:photo).should be(mock_photo)
    end
  end

  describe "GET new" do
    it "redirects to the bathrooms list" do
      Photo.stub(:find) { mock_photo }
      get :new
      response.should redirect_to(photo_url)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created photo as @photo" do
        Photo.stub(:new).with({'these' => 'params'}) { mock_photo(:save => true) }
        post :create, :photo => {'these' => 'params'}
        assigns(:photo).should be(mock_photo)
      end

      it "redirects to the created photo" do
        Photo.stub(:new) { mock_photo(:save => true) }
        post :create, :photo => {}
        response.should redirect_to(photo_url(mock_photo))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved photo as @photo" do
        Photo.stub(:new).with({'these' => 'params'}) { mock_bathroom(:save => false) }
        post :create, :photo => {'these' => 'params'}
        assigns(:photo).should be(mock_photo)
      end

      it "re-renders the 'new' template" do
        Photo.stub(:new) { mock_photo(:save => false) }
        post :create, :photo => {}
        response.should render_template("new")
      end
    end
  end


  describe "DELETE destroy" do
    it "destroys the requested bathroom" do
      photo.stub(:find).with("37") { mock_photo }
      mock_photo.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the bathrooms list" do
      Photo.stub(:find) { mock_photo }
      delete :destroy, :id => "1"
      response.should redirect_to(photo_url)
    end
  end

end

