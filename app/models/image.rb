class Image < ActiveRecord::Base
  attr_accessible :hidden
  has_attached_file :pic, :styles => { :medium => "300x300", :thumb => "100x100>", :small => "200x200", :small_thumb => "50x50>" }

  belongs_to :user

  scope :hidden, where(:hidden => true)
  scope :shown, where(:hidden => false)
end
