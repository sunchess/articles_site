require 'acts_as_list'
class Article < ActiveRecord::Base
  attr_accessible :name, :body, :category_id, :preview, :status, :position, :publish_on_main
  acts_as_commentable
  acts_as_list


  belongs_to :category, :counter_cache => true
  belongs_to :user, :counter_cache => true
  has_many :relative_articles, :dependent => :destroy
  has_many :relatives, :through => :relative_articles

  validates_presence_of :name, :body, :category_id, :preview
  validates_length_of :name, :within => 10..100
  validates_length_of :preview, :within => 100..2000
  validates_length_of :body, :within => 500..50000

  scope :published, where(:aasm_status => :publics)
  scope :draft, where(:aasm_status=> :draft)
  scope :deleted, where(:aasm_status => :deleted)
  scope :not_deleted, where(:aasm_status => [:publics, :draft])

  def relative_ids
    self.relatives.published.map(&:id)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end


  define_index do
    indexes name
    indexes preview
    indexes body
    has category_id
    where "aasm_status = 'publics'"

    set_property :delta => true
  end


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
