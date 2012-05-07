class CreateRalativeArticles < ActiveRecord::Migration
  def self.up
    create_table :relative_articles do |t|
      t.integer :article_id
      t.integer :relative_id
    end

  #  add_index :relative_articles, :article_id
  #  add_index :relative_articles, :relative_id
  end

  def self.down
  #  add_index :relative_articles, :relative_id
  #  add_index :relative_articles, :article_id

    drop_table :ralative_articles
  end
end
