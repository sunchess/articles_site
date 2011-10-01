class Article < ActiveRecord::Base
  attr_accessible :name, :body, :category_id, :preview, :status
  acts_as_commentable


  belongs_to :category, :counter_cache => true
  belongs_to :user, :counter_cache => true
  validates_presence_of :name, :body, :category_id, :preview
  validates_length_of :name, :within => 10..100
  validates_length_of :preview, :within => 100..2000
  validates_length_of :body, :within => 500..50000

  scope :published, where(:aasm_status => :publics)
  scope :draft, where(:aasm_status=> :draft)
  scope :deleted, where(:aasm_status => :deleted)
  scope :not_deleted, where(:aasm_status => [:publics, :draft])


  include AASM

  aasm_column :aasm_status # defaults to aasm_state

  aasm_initial_state :draft

  aasm_state :draft
  aasm_state :publics
  aasm_state :deleted


  aasm_event :publishing do
    transitions :to => :publics, :from => ["draft", "deleted"]
  end

  aasm_event :delete do
    transitions :to => :deleted, :from => ["draft", "publics"]
  end

  def author
    self.user.username
  end


end
