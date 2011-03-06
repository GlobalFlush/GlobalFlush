class Comment < ActiveRecord::Base
  belongs_to :bathroom
  has_one :rating
  belongs_to :user
end
