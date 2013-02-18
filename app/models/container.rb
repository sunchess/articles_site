class Container < ActiveRecord::Base
  attr_accessible :name, :description, :image, :position

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_presence_of :name, :description, :image, :position
end
