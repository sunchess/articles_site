require 'acts_as_list'
class Store < ActiveRecord::Base
  acts_as_list
  attr_accessor :product
  attr_accessible :name, :description, :where_from, :honey_sort,
                  :logo, :on_index, :on_top, :shown, :price, :product,
                  :prod, :fresh, :position, :logo_name, :gather_place,
                  :certificate


  has_attached_file :logo, :styles => {:big => "400x400>", :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :gather_place, :styles => {:big => "400x400>", :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :certificate, :styles => {:big => "600x900>", :medium => "300x300>", :thumb => "100x100>" }

  validates_presence_of :name, :description, :where_from,  :price
  #validates_presence_of :honey_sort, :if => Proc.new{ |store| store.product == "true" }



  scope :at_index, where(:on_index => true).order(:position)
  scope :at_top, where(:on_top => true)
  scope :shown, where(:shown => true).order(:position)

  def self.short_weight
    range = (100..1000)
    range.step(100).to_a
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
