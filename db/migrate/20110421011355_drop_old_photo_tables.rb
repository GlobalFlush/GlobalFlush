class DropOldPhotoTables < ActiveRecord::Migration
  def self.up
    drop_table :bathroom_photos
    drop_table :graffiti_photos
  end

  def self.down
    create_table "bathroom_photos", :force => true do |t|
      t.integer  "user_id"
      t.integer  "bathroom_id"
      t.string   "type"
      t.boolean  "moderated",          :default => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.datetime "photo_updated_at"
    end
    create_table "graffiti_photos", :force => true do |t|
      t.integer  "user_id"
      t.integer  "graffiti_id"
      t.string   "type"
      t.boolean  "moderated",          :default => false
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.datetime "photo_updated_at"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

end
