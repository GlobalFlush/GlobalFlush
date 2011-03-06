class AddCommentIdToRating < ActiveRecord::Migration
  def self.up
    add_column :ratings, :comment_id, :integer
    remove_column :comments, :rating_id
  end

  def self.down
    remove_column :ratings, :comment_id
    add_column :comments, :rating_id, :integer
  end
end
