class AddProdToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :prod, :boolean, :default => false, :null=>false
  end

  def self.down
    remove_column :stores, :prod
  end
end
