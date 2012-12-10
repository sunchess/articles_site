class AddGatherPlaceToStores < ActiveRecord::Migration
  def self.up
  	add_column :stores, :gather_place_file_name, :string
  	add_column :stores, :gather_place_content_type, :string
  	add_column :stores, :gather_place_file_size, :integer
  	add_column :stores, :gather_place_updated_at, :datetime
  end

  def self.down
  	remove_column :stores, :gather_place_file_name, :string
  	remove_column :stores, :gather_place_content_type, :string
  	remove_column :stores, :gather_place_file_size, :integer
  	remove_column :stores, :gather_place_updated_at, :datetime
  end
end
