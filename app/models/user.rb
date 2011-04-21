#User is the person browsing the website, can add bathrooms, make comments about a bathroom, rate a bathroom, upload photos about a bathroom, search for bathrooms.
#User has a one to many relationship with comments, e.i. a user can make many comments but one comment can only be written by one user.
#User has a one to many relationship with bathroom, e.i. a user can create many bathrooms but a bathroom can only be created by one user.
#User has a one to many relationship with bathroomPhotos, e.i. a bathroom has many photos but a photo can only associate with one bathroom.
#User have the following attributes:
# - login: the username of the user
# - emails: the email address of the user
# - password: the password the user use to login, is separated into multiple forms in encrypted states
# - many login information such as ip, login timestamps, failed logins, tokens.
# - timestamp: the date of creation and update
class User < ActiveRecord::Base
  acts_as_authentic

  has_many :comments, :dependent => :destroy
  has_many :bathrooms, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  

  accepts_nested_attributes_for :bathrooms, :allow_destroy => true
  accepts_nested_attributes_for :comments, :allow_destroy => true
  accepts_nested_attributes_for :photos, :allow_destroy => true

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end
