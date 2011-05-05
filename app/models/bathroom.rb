#Bathroom is the place where you go for relief, many places have these and each Bathroom describes the location as well as other information associated with a bathroom
#Bathroom has a one to many relationship with comments, e.i. a bathroom can have many comments.
#Bathroom has a one to many relationship with ratings, e.i. a bathroom cna have many ratings.
#Bathroom has a one to many relationship with graffiti, e.i. a bathroom can have many graffiti.
#Bathroom has a one to one relationship with address, e.i. a bathroom can only have one address.
#Bathroom has a one to many relationship with bathroomSpec, e.i. a bathroom can have many specs.
#Bathroom has a one to many relationship with bathroom_photos, e.i. a bathroom can have many photos.
#Bathroom has a one to many relationship with user, e.i a user can create many bathrooms but a bathroom can only be created by one user.
#Bathroom have the following attributes:
# - title: the name of the bathroom or location name
# - gender: the gender the bathroom is for
# - user_id: id of the user who created the bathroom
# - description: a short summary that described the bathroom
# - hidden: flag for admin and mod usage that hides the bathroom from website
# - moderated: flag for admin and mod usage
# - timestamp: the date of creation and update
# - inside_location: location of the bathroom inside the building

class Bathroom < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :graffiti, :dependent => :destroy
  has_one :address, :dependent => :destroy
  has_many :bathroom_specs, :dependent => :destroy
  has_many :photos, :as => :imageable, :dependent => :destroy

  belongs_to :user

  accepts_nested_attributes_for :comments, :allow_destroy => true
  accepts_nested_attributes_for :ratings, :allow_destroy => true
  accepts_nested_attributes_for :graffiti, :allow_destroy => true
  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :bathroom_specs, :allow_destroy => true
  accepts_nested_attributes_for :photos, :allow_destroy => true
  

  attr_accessible :comments_attributes, :ratings_attributes, :graffiti_attributes, :address_attributes, :bathroom_specs_attributes, :photos_attributes,
                  :title, :gender, :description, :user_id, :hidden, :moderated, :inside_location


  validates_presence_of :title
  validates_presence_of :gender
  validates_presence_of :description
  validates_presence_of :inside_location


  # Return the title of the bathroom
  def name
    title + " - " + inside_location.to_s + " - " + gender
  end

  # Search function, perform a full text search on the address and ratings
  named_scope :search_by_address, lambda { |keyword, gender, order|
    {
        :joins => :address,
        :include => :ratings,
        :conditions => ['gender LIKE ? AND (inside_location LIKE ? OR street_address LIKE ? OR city LIKE ? OR state LIKE ? OR zip LIKE ? OR country LIKE ? OR title LIKE ?)', "#{gender}", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"],
        :order => order
    }
  }
  
end
