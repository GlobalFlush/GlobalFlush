#Comment is the review and comments a user submit on a bathroom page about the bathroom
#Comment belongs to a bathroom, e.i. a bathroom can have many comments but a comment can only belong to one bathroom.
#Comment belongs to a user, e.i a user can have many comments but a comment can only be written by one user.
#Comment has one ratings, e.i. every comment object comes with a set or ratings that go with it.
#Comment has the following attributes:
# - bathroom_id: the id of the bathroom this comment is associated with
# - user_id: the id of te use who created the comment
# - body: the text of the comment the user made
# - rating_id: the id of the ratings object associated with the comment
# - moderated: a flag for checking if the comment has been okayed by the mod or admin
# - timestamp: the date of creation and update
class Comment < ActiveRecord::Base
  belongs_to :bathroom
  has_one :rating, :dependent => :destroy
  belongs_to :user
  
  #allows comment object to receive nested attributes, in this case rating attributes
  accepts_nested_attributes_for :rating, :allow_destroy => true
  #determines which attributes are accessible from controllers
  attr_accessible :rating_attributes, :user_id, :bathroom_id, :body, :moderated, :created_at

  validates_presence_of :bathroom_id
  validates_presence_of :user_id
  validates_presence_of :body


end
