class Address < ActiveRecord::Base
  belongs_to :bathroom

  def to_s
    inside_location + ', ' + street_address + ', ' + city + ', ' + state + ', ' + zip + ', ' + country
  end
end
