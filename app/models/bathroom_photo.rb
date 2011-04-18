#BathroomPhoto is a photo associated with a bathroom
#BathroomPhoto has a one to many relationship with user, e.i. a user can upload many photos but a photo can only be uploaded by one user.
#BathroomPhoto has a one to many relationship with bathroom, e.i a bathroom can have many photos but a photos can only associated with one bathroom.
#BathroomPhoto have the following attributes:
# - user_id: the id of the user who uploaded the photo
# - bathroom_id: the id of the bathroom the photo is associated with
# - type: the type of photo this photo is, graffiti or not
# - photo_file_name: file name of the photo uploaded
# - photo_contend_type: the file format of the photo
# - photo_file_size: the size of the photos
# - timestamp: the date of creation and update
class BathroomPhoto < ActiveRecord::Base
  belongs_to :user
  belongs_to :bathroom

  has_attached_file :photo,
                    :styles           => {:thumb => "120x80>", :small=>"240x160", :medium=>"640x426"},
                    :url              => "/assets/bathrooms/photos/:id/:style/:basename.:extension",
                    :path             => ":rails_root/public/assets/bathrooms/photos/:id/:style/:basename.:extension",
                    :whiny_thumbnails => true

  #validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/bmp', 'image/gif']
  
end
