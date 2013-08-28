class Add3liters1Liters < ActiveRecord::Migration
  def self.up
    add_column :stores, :price_three_liters, :integer, :default => 0
    add_column :stores, :price_one_liter, :integer, :default => 0
  end

  def self.down
    remove_column :stores, :price_three_liters
    remove_column :stores, :price_one_liter
  end
end
