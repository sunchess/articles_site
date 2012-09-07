class Recipe < ActiveRecord::Base
  attr_accessible :title, :body, :user_name, :shown

  validates_presence_of :user_name
  validates_length_of :user_name, :within => 5..70

  validates_presence_of :title
  validates_length_of :title, :within => 5..70

  validates_presence_of :body
  validates_length_of :body, :within => 30..3000

  scope :showned, where(:shown => true)

end
