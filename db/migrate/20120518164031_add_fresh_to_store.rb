class AddFreshToStore < ActiveRecord::Migration
  def self.up
  	add_column :stores, :fresh, :boolean, :null => false, :default => false
  end

  def self.down
  	remove_column :stores, :fresh
  end
end
