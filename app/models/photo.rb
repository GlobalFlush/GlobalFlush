#Photo is a class 
#Photo has a one to many relationship with users, e.i. a photo can only belong to one user but a user can have many photos
#Photo have the following attributes:
# - user_id: the id fo the user the photo is associated with
# - imagable_id: look up id
# - imagable_type: the type of a photo, either a bathroom photo or a graffiti
# - moderated: flag for admin and mod usage
# - timestamp: the date of creation and update
class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :imageable, :polymorphic => true

  has_attached_file :image,
                    :styles           => {:thumb => "120x80#", :small=>"240x160#", :medium=>"640x426"},
                    :url              => "/assets/photos/:id/:style/:basename.:extension",
                    :path             => ":rails_root/public/assets/photos/:id/:style/:basename.:extension",
                    :whiny_thumbnails => true

  #validates_attachment_presence :photo
  validates_attachment_size :image, :less_than => 10.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/bmp', 'image/gif']
  
end
