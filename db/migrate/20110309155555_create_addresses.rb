class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country
      t.string :longitude
      t.string :latitude
      t.integer :bathroom_id
      t.string :inside_location
      
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
