require 'spec_helper'

describe BathroomsController do

  def mock_bathroom(stubs={})
    @mock_bathroom ||= mock_model(Bathroom, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all bathrooms as @bathrooms" do
      Bathroom.stub(:all) { [mock_bathroom] }
      get :index
      assigns(:bathrooms).should eq([mock_bathroom])
    end
  end

  describe "GET show" do
    it "assigns the requested bathroom as @bathroom" do
      Bathroom.stub(:find).with("37") { mock_bathroom }
      get :show, :id => "37"
      assigns(:bathroom).should be(mock_bathroom)
    end
  end

  describe "GET new" do
    it "assigns a new bathroom as @bathroom" do
      Bathroom.stub(:new) { mock_bathroom }
      get :new
      assigns(:bathroom).should be(mock_bathroom)
  end

  describe "GET edit" do
    it "assigns the requested bathroom as @bathroom" do
      Bathroom.stub(:find).with("37") { mock_bathroom }
      get :edit, :id => "37"
      assigns(:bathroom).should be(mock_bathroom)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created bathroom as @bathroom" do
        Bathroom.stub(:new).with({'these' => 'params'}) { mock_bathroom(:save => true) }
        post :create, :bathroom => {'these' => 'params'}
        assigns(:bathroom).should be(mock_bathroom)
      end

      it "redirects to the created bathroom" do
        Bathroom.stub(:new) { mock_bathroom(:save => true) }
        post :create, :bathroom => {}
        response.should redirect_to(bathroom_url(mock_bathroom))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved bathroom as @bathroom" do
        Bathroom.stub(:new).with({'these' => 'params'}) { mock_bathroom(:save => false) }
        post :create, :bathroom => {'these' => 'params'}
        assigns(:bathroom).should be(mock_bathroom)
      end

      it "re-renders the 'new' template" do
        Bathroom.stub(:new) { mock_bathroom(:save => false) }
        post :create, :bathroom => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bathroom" do
        Bathroom.stub(:find).with("37") { mock_bathroom }
        mock_bathroom.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bathroom => {'these' => 'params'}
      end

      it "assigns the requested bathroom as @bathroom" do
        Bathroom.stub(:find) { mock_bathroom(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:bathroom).should be(mock_bathroom)
      end

      it "redirects to the bathroom" do
        Bathroom.stub(:find) { mock_bathroom(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(bathroom_url(mock_bathroom))
      end
    end

    describe "with invalid params" do
      it "assigns the bathroom as @bathroom" do
        Bathroom.stub(:find) { mock_bathroom(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:bathroom).should be(mock_bathroom)
      end

      it "re-renders the 'edit' template" do
        Bathroom.stub(:find) { mock_bathroom(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested bathroom" do
      Bathroom.stub(:find).with("37") { mock_bathroom }
      mock_bathroom.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the bathrooms list" do
      Bathroom.stub(:find) { mock_bathroom }
      delete :destroy, :id => "1"
      response.should redirect_to(bathroom_url)
    end
  end

end