require 'spec_helper'

describe Bathroom do
  it "can be instantiated" do
    Bathroom.new.should be_an_instance_of(Bathroom)
  end

end
