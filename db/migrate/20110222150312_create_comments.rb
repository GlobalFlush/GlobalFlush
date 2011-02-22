class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
	  t.integer :bathroom_id, :null => false
	  t.integer :user_id, :null => false
	  t.string :text
	  t.integer :rating_id, :null => false
	  t.integer :moderated, :default => 0
      t.timestamps

	  add_index :ratings, :id, :name => "rating_id"
    end
  end

  def self.down
    drop_table :comments
  end
end
