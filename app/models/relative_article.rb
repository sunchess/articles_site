class RelativeArticle < ActiveRecord::Base
  attr_accessible :article_id, :relative_id

  belongs_to :articles
  belongs_to :relative, :class_name => "Article", :foreign_key => "relative_id"
end
