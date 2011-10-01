class Image < ActiveRecord::Base
  VARIANTS = { :biggest => "600x600", :bigger => "500x500", :big=> "400x400", :medium => "300x300", :small => "200x200", :thumb => "100x100>", :small_thumb => "50x50>" }

  attr_accessible :hidden, :pic
  has_attached_file :pic, :styles => VARIANTS 

  belongs_to :user

  scope :hidden, where(:hidden => true)
  scope :shown, where(:hidden => false)

  validates_attachment_presence :pic
  validates_attachment_size :pic, :less_than => 5.megabytes
  validates_attachment_content_type :pic, :content_type => /image/i

  
    
end
