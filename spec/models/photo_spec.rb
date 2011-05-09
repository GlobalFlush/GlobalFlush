require 'spec_helper'

describe Photo do
  it "can be instantiated" do
    Photo.new.should be_an_instance_of(Photo)
  end

end