class Article < ActiveRecord::Base
  attr_accessible :name, :body, :category_id, :preview

  belongs_to :category, :counter_cache => true
  belongs_to :user, :counter_cache => true
  validates_presence_of :name, :body, :category_id, :preview
  validates_length_of :name, :within => 10..100
  validates_length_of :preview, :within => 100..2000
  validates_length_of :body, :within => 500..50000

  scope :published, where(:status => :public)
  scope :draft, where(:status => :draft)
  scope :deleted, where(:status => :deleted)


  include AASM

  aasm_column :status # defaults to aasm_state

  aasm_initial_state :draft

  aasm_state :draft
  aasm_state :public
  aasm_state :deleted


  aasm_event :publish do
    transitions :to => :publics, :from => [:draft, :deleted]
  end

  aasm_event :delete do
    transitions :to => :deleted, :from => [:draft, :publics]
  end

end
