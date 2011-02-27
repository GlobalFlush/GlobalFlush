class CreateBathrooms < ActiveRecord::Migration
  def self.up
    create_table :bathrooms do |t|
	  t.string :building_name, :null => false
	  t.decimal :longitude
	  t.decimal :latitude
	  t.string :address
	  t.string :location, :null => false
	  t.integer :gender, :null =>false
	  t.text :description
	  t.integer :user_id, :null => false
	  t.boolean :hidden, :default => 1
	  t.integer :moderated, :default => 0
      t.timestamps
	  
	  add_index :users, :id, :name => "user_id"
    end
  end

  def self.down
    drop_table :bathrooms
  end
end
