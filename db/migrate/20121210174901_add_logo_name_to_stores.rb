class AddLogoNameToStores < ActiveRecord::Migration
  def self.up
    add_column :stores, :logo_name, :string
  end

  def self.down
    remove_column :stores, :logo_name
  end
end
