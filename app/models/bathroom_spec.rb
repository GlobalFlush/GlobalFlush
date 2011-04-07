#BathroomSpec is the attributes associated with a bathroom.
#BathroomSpec has a one to many relationship with bathroom, e.i. a bathroomSpec can only belong to one bathroom and one bathroom can only have many bathroomSpec
#BathroomSpec has the following attributes:
# - bathroom_id: the id of the bathroom this spec is associated with
# - key: the name of the attribute describing the bathroom
# - value: the actual value of the attribute the spec is describing
# - moderated: flag for admin and mod usage
# - timestamp: the date of creation and update
class BathroomSpec < ActiveRecord::Base
  belongs_to :bathroom
end
