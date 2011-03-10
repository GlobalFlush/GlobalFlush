class User < ActiveRecord::Base
  acts_as_authentic

  has_many :comments, :dependent => :destroy
  has_many :bathrooms, :dependent => :destroy

  accepts_nested_attributes_for :bathrooms, :allow_destroy => true
  accepts_nested_attributes_for :comments, :allow_destroy => true

  attr_accessible :comments_attributes, :bathrooms_attributes
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
end
