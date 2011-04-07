#Rating is a set of numbers that score a bathroom on it's cleanliness, smelliness, and overall quality.
#Rating has a one to many relationship with bathroom, e.i one rating can only pertain to one bathroom and one bathroom can have many ratings.
#Rating has a one to one relationship with comment, e.i. comment can only have one rating and one rating can only belong to one comment.
#Rating have the following attributes:
# - bathroom_id: the id of the bathroom the rating is scoring
# - smell: the score of how smelly the bathroom is from 0 to 5 (0 being the smelliest, 5 being refreshing).
# - clean: the score of how clean the bathroom is from 0 to 5 (0 being the dirtiest, 5 being very clean).
# - overall: the score of the overall quality of the bathroom from 0 to 5 (0 being very poor, 5 being very good).
# - timestamp: the date of creation and update
class Rating < ActiveRecord::Base
  belongs_to :bathroom
  belongs_to :comment
end
