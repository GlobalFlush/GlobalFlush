class Rating < ActiveRecord::Base
  belongs_to :bathroom
  belongs_to :comment
end
