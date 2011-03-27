class CreateBathroomPhotos < ActiveRecord::Migration
  def self.up
    create_table :bathroom_photos do |t|

      t.integer :user_id
      t.integer :bathroom_id
      t.string :type
      t.boolean :moderated, :default => :false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :bathroom_photos
  end
end
