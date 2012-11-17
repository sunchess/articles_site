class AddPublishOnMainColumnToArticles < ActiveRecord::Migration
  def self.up
  	add_column :articles, :publish_on_main, :boolean
  end

  def self.down
  	remove_column :articles, :publish_on_main
  end
end
