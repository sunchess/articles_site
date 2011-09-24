class AddUserIdToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :user_id, :integer, :null=>false
    add_index :articles, :user_id
  end

  def self.down
    remove_index :articles, :column => :user_id
    remove_column :articles, :user_id
  end
end
