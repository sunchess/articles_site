class AddPreviewToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :preview, :text
  end

  def self.down
    remove_column :articles, :preview
  end
end
