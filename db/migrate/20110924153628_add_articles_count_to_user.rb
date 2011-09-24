class AddArticlesCountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :articles_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :users, :articles_count
  end
end
