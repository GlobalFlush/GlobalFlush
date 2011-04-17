#GraffitiPhoto is a photo associated with a graffiti
#GraffitiPhoto has a one to many relationship with user, e.i. a user can upload many photos but a photo can only be uploaded by one user.
#GraffitiPhoto has a one to many relationship with graffiti, e.i a graffiti can have many photos but a photos can only associated with one graffiti.
#GraffitiPhoto have the following attributes:
# - user_id: the id of the user who uploaded the photo
# - graffiti_id: the id of the bathroom the photo is associated with
# - type: the type of photo this photo is, graffiti or not
# - photo_file_name: file name of the photo uploaded
# - photo_contend_type: the file format of the photo
# - photo_file_size: the size of the photos
# - timestamp: the date of creation and update
class GraffitiPhoto < ActiveRecord::Base
  belongs_to :user
  belongs_to :graffiti

  has_attached_file :photo,
                    :styles           => {:thumb => "120x80>", :small=>"220x147", :medium=>"640x426"},
                    :url              => "/assets/graffiti/photos/:id/:style/:basename.:extension",
                    :path             => ":rails_root/public/assets/graffiti/photos/:id/:style/:basename.:extension",
                    :whiny_thumbnails => true

  #validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 10.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/bmp', 'image/gif']
  
end
