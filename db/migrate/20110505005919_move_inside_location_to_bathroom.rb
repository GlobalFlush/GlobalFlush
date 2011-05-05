class MoveInsideLocationToBathroom < ActiveRecord::Migration
  def self.up
    add_column :bathrooms, :inside_location, :string
    remove_column :addresses, :inside_location
  end

  def self.down
    add_column :addresses, :inside_location, :string
    remove_column :bathrooms, :inside_location
  end
end
