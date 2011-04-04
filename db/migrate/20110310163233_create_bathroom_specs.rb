class CreateBathroomSpecs < ActiveRecord::Migration
  def self.up
    create_table :bathroom_specs do |t|
      t.integer :bathroom_id
      t.string :key, :null => false
      t.string :value, :null => false
      t.integer :moderated, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :bathroom_specs
  end
end
