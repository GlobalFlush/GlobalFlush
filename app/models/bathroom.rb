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
  

  attr_accessible :comments_attributes, :ratings_attributes, :graffitis_attributes, :address_attributes, :bathroom_specs_attributes, :bathroom_photos_attributes,
                  :title, :gender, :description, :user_id, :hidden, :moderated


  named_scope :search_by_address, lambda { |keyword|
    {
        :joins => :address,
        :conditions => ['inside_location LIKE ? OR street_address LIKE ? OR city LIKE ? OR state LIKE ? OR zip LIKE ? OR country LIKE ?', keyword, keyword, keyword, keyword, keyword, keyword],
        :order => 'bathrooms.updated_at DESC'
    }
  }
  
end
