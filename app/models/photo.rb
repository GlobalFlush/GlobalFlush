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
