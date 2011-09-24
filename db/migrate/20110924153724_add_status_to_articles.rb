class AddStatusToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :status, :string, :default => :draft, :null => false
    add_index :articles, :status
  end

  def self.down
    remove_index :articles, :column => :status
    remove_column :articles, :status
  end
end
