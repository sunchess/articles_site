class Recipe < ActiveRecord::Base
  attr_accessible :title, :body, :user_name, :shown, :recipe_category_id

  has_many :recipes_comments, :dependent => :destroy, :order => "created_at DESC"
  belongs_to :recipe_category, :counter_cache => true

  validates_presence_of :user_name
  validates_length_of :user_name, :within => 5..70

  validates_presence_of :body
  validates_length_of :body, :within => 30..3000

  validates_presence_of :recipe_category_id

  scope :showned, where(:shown => true)
  scope :unpublished, where(:shown => false)
  scope :lasts, limit(3)

end
