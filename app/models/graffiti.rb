#Graffiti is a graffiti that a user might find on the stalls of a bathroom
#Graffit has a one to many relationship with bathroom, e.i. a graffiti can only belong to one bathroom but a bathroom can have many graffitis
#Graffiti have the following attributes:
# - bathroom_id: the id fo the bathroom the graffiti is associated with
# - name: the name of the graffiti
# - description: a simple description of the graffiti
# - moderated: flag for admin and mod usage
# - timestamp: the date of creation and update
class Graffiti < ActiveRecord::Base
  belongs_to :bathroom
end
