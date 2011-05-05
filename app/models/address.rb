
#Address and bathrooms have a one to one relationship, e.i. a bathroom can only have one address and one address can only belong to one bathroom.
#Address has the attributes:
# - street_address: address of the bathroom building or venue
# - city: the city in which the bathroom is located in
# - state: the state the bathroom is located in
# - zip: the zip code of the bathroom location
# - country: the country that the bathroom resides in
# - longitude: the longitude position of the bathroom
# - latitude: the latitude position of the bathroom
# - timestamp: the date of creation and update
class Address < ActiveRecord::Base
  belongs_to :bathroom

  validates_presence_of :street_address, :city, :state, :country, :zip, :longitude, :latitude
  
  # toString function for combining the address attributes into one string
  def to_s
    addr_a = [street_address, city, state, zip, country]
    addr_a.to_s

    addr_s = addr_a[0]
    (addr_a.length-1).times do |i|
      addr_s += ', ' + addr_a[i+1] unless addr_a[i+1].nil?
    end
    addr_s
  end
end
