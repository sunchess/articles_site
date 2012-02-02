class Store < ActiveRecord::Base
  attr_accessor :product
  attr_accessible :name, :description, :where_from, :honey_sort, :logo, :on_index, :on_top, :shown, :price, :product


  has_attached_file :logo, :styles => {:big => "400x400>", :medium => "300x300>", :thumb => "100x100>" }

  validates_presence_of :name, :description, :where_from,  :price
  #validates_presence_of :honey_sort, :if => Proc.new{ |store| store.product == "true" }



  scope :at_index, where(:on_index => true)
  scope :at_top, where(:on_top => true)
  scope :shown, where(:shown => true)

end
