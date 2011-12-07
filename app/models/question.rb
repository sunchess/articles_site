class Question < ActiveRecord::Base
  attr_accessible :name, :body, :shown

  validates_presence_of :name, :body

  has_one :answer
end
