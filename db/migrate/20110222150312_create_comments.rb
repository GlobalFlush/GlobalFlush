class CreateComments < ActiveRecord::Migration
  def self.up
    #
    create_table :comments do |t|
      t.integer :bathroom_id
      t.integer :user_id
      t.string  :body
      t.integer :rating_id, :null => false
      t.integer :moderated, :default => 0
      t.timestamps

    end
  end

  def self.down
    drop_table :comments
  end
end
