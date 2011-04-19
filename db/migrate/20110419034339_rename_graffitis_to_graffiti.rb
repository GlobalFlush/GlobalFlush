class RenameGraffitisToGraffiti < ActiveRecord::Migration
  def self.up
    rename_table :graffitis, :graffiti
  end

  def self.down
    rename_table :graffiti, :graffitis
  end
end
