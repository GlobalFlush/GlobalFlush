require 'spec_helper'

describe UserSession do
  
  before(:each) do
    @valid_attributes = {
      :login => "testing",
      :password => "123456",
      :password_confirmation => "123456",
      :email => "testing@hotmail.com"
    }

    user = User.find_or_create_by_login("testing")
    user.login = "testing"
    user.email = "testing@hotmail.com"
    user.password = "123456"
    user.password_confirmation = "123456"
    user.save!

    Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)
  end

  it "should create a new instance given valid attributes" do
    UserSession.create!(@valid_attributes)
  end
  it "can be instantiated" do
    UserSession.new.should be_an_instance_of(UserSession)
  end

  it "can be saved successfully" do
#    UserSession.create.should be_persisted
  end




end 