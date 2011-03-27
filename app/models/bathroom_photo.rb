class BathroomPhoto < ActiveRecord::Base
  belongs_to :user
  belongs_to :bathroom

  has_attached_file :photo,
                    :styles           => {:thumb => "100x100>", :small => "150x150>"},
                    :url              => "/assets/bathrooms/photos/:id/:style/:basename.:extension",
                    :path             => ":rails_root/public/assets/bathrooms/photos/:id/:style/:basename.:extension",
                    :whiny_thumbnails => true

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/bmp', 'image/gif']
  
end
