class Store < ActiveRecord::Base
  attr_accessible :name, :description, :where_from, :honey_sort, :logo, :on_index, :on_top, :shown, :price

  has_attached_file :logo, :styles => {:big => "400x400>", :medium => "300x300>", :thumb => "100x100>" }

  validates_presence_of :name, :description, :where_from, :honey_sort, :price

  scope :at_index, where(:on_index => true)
  scope :at_top, where(:on_top => true)
  scope :shown, where(:shown => true)
  
end
