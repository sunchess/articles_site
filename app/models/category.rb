require 'acts_as_list'
class Category < ActiveRecord::Base
  acts_as_list
  attr_accessible :name, :position

  default_scope order("position")

  has_many :articles, :order => "created_at", :dependent => :destroy

  validates_uniqueness_of :name
  validates_presence_of :name, :position
  validates_numericality_of :position

end
