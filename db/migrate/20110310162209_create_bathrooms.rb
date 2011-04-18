class CreateBathrooms < ActiveRecord::Migration
  def self.up
    create_table :bathrooms do |t|
      t.string :title
      t.string :gender
      t.integer :user_id
      t.decimal :longitude
      t.decimal :latitude
      t.text :description
      t.boolean :hidden, :default => 1
      t.integer :moderated, :default => 0
      
      t.timestamps
    end
  end

  def self.down
    drop_table :bathrooms
  end
end
