class RemoveLongitudeInBathroom < ActiveRecord::Migration
  def self.up
    remove_column :bathrooms, :longitude
    remove_column :bathrooms, :latitude
  end

  def self.down
    add_column :bathrooms, :latitude, :decimal
    add_column :bathrooms, :longitude, :decimal    
  end
end
