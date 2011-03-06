class Bathroom < ActiveRecord::Base
  has_many :graffitis
  has_many :comments
  has_many :attributes
  has_many :ratings

  belongs_to :user
  
end
