class CreateGraffitiPhoto < ActiveRecord::Migration
  def self.up
    create_table :graffiti_photos do |t|

      t.integer :user_id
      t.integer :graffiti_id
      t.string :type
      t.boolean :moderated, :default => 0
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :graffiti_photos
  end
end
