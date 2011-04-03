class CreateRatings < ActiveRecord::Migration
  def self.up
	#create the attributes for a rating object: 
	#bathroom id is the bathroom the rating is for, 
	#smell is the rating for smelliness, 
	#clean is the rating for cleanliness, 
	#overall is the overall rating for the bathroom
	#timestamps is the date and time of when the object was created
    create_table :ratings do |t|
      t.integer :bathroom_id
      t.integer :smell, :null => false
      t.integer :clean, :null => false
      t.integer :overall, :null => false
      t.timestamps

    end
  end

  def self.down
    drop_table :ratings
  end
end
