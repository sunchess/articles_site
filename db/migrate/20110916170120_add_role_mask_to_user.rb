class AddRoleMaskToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role_mask, :integer, :null=>false, :default => 0
  end

  def self.down
    remove_column :users, :role_mask
  end
end
