class Address < ActiveRecord::Base
  belongs_to :bathroom

  def to_s
    addr_a = [inside_location, street_address, city, state, zip, country]
    addr_a.to_s

    addr_s = addr_a[0]
    (addr_a.length-1).times do |i|
      addr_s += ', ' + addr_a[i+1] unless addr_a[i+1].nil?
    end
    addr_s
  end
end
