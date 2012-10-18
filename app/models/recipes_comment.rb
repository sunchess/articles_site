class RecipesComment < ActiveRecord::Base
  attr_accessible :user_name, :email, :body, :shown

  belongs_to :recipe

  validates :user_name, :presence => true
  validates :body, :presence => true
  validates :email, :presence => true
  validates :email, :format => { :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i , :on => :create }

  scope :shown, where(:shown => true)

  after_create {|comment| AppMailer.new_comment_recipe(comment).deliver }
end
