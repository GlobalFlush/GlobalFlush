class CreateGraffitis < ActiveRecord::Migration
  def self.up
    create_table :graffitis do |t|
	  t.integer :bathroom_id, :null => false
	  t.string :name, :null => false
	  t.string :description
	  t.integer :moderated, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :graffitis
  end
end
