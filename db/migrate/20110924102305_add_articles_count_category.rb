class AddArticlesCountCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :articles_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :categories, :articles_count
  end
end
