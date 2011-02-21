class CreateAttributes < ActiveRecord::Migration
  def self.up
    create_table :attributes do |t|
	  t.integer :bathroom_id, :null => false
	  t.string :key, :null => false
	  t.string :value, :null => false
	  t.integer :moderated, :default => 0
      t.timestamps
	  
    end
  end

  def self.down
    drop_table :attributes
  end
end
