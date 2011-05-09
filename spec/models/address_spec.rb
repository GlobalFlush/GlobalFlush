require 'spec_helper'

describe Address do
  it "can be instantiated" do
    Address.new.should be_an_instance_of(Address)
  end

end