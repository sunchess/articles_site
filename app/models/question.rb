class Question < ActiveRecord::Base
  attr_accessible :name, :body, :shown

  validates_presence_of :name, :body

  has_one :answer

  scope :shown, where(:shown => true)
  scope :hidden, where(:shown => false)


  def to_param
    "#{id}-#{body.parameterize}"
  end
end
