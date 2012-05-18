class Question < ActiveRecord::Base
  attr_accessible :name, :body, :shown

  validates_presence_of :name, :body

  has_one :answer
  has_many :relative_questions, :dependent => :destroy
  has_many :relatives, :through => :relative_questions

  scope :shown, where(:shown => true)
  scope :hidden, where(:shown => false)

  def relative_ids
    self.relatives.shown.map(&:id)
  end

  def to_param
    "#{id}-#{body.parameterize}"
  end
end
