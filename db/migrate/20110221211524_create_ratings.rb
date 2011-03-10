class CreateRatings < ActiveRecord::Migration
  def self.up
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
