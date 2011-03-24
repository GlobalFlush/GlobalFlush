class Comment < ActiveRecord::Base
  belongs_to :bathroom
  has_one :rating, :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for :rating, :allow_destroy => true

  attr_accessible :rating_attributes, :user_id, :bathroom_id, :body, :moderated
end
