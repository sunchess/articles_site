class AddIndexToRelateveArticles < ActiveRecord::Migration
  def self.up
    add_index :relative_articles, :article_id
    add_index :relative_articles, :relative_id
  end

  def self.down
    remove_index :relative_articles, :column => :relative_id
    remove_index :relative_articles, :column => :article_id
  end
end
