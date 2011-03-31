class Bathroom < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :graffitis, :dependent => :destroy
  has_one :address, :dependent => :destroy
  has_many :bathroom_specs, :dependent => :destroy
  has_many :bathroom_photos, :dependent => :destroy

  belongs_to :user

  accepts_nested_attributes_for :comments, :allow_destroy => true
  accepts_nested_attributes_for :ratings, :allow_destroy => true
  accepts_nested_attributes_for :graffitis, :allow_destroy => true
  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :bathroom_specs, :allow_destroy => true
  accepts_nested_attributes_for :bathroom_photos, :allow_destroy => true
  
  

#  attr_accessible :comments_attributes, :ratings_attributes, :graffitis_attributes, :address_attributes, :bathroom_specs_attributes
					

#                :photo_file_name, :photo_content_type, :photo_file_size, :photo

  
#  has_attached_file :photo,
#          :styles => {:thumb => "100x100>", :small => "150x150>"},
#          :url => "/assets/bathrooms/:id/:style/:basename.:extension",
#          :path => ":rails_root/public/assets/bathrooms/:id/:style/:basename.:extension",
#          :whiny_thumbnails => true

#  validates_attachment_presence :photo
#  validates_attachment_size :photo, :less_than => 5.megabytes
#  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/bmp']
  
end
