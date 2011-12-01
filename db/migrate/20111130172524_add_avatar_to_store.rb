class AddAvatarToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :logo_file_name,    :string
    add_column :stores, :logo_content_type, :string
    add_column :stores, :logo_file_size,    :integer
    add_column :stores, :logo_updated_at,   :datetime
    add_column :stores, :price, :integer  
  end

  def self.down
    remove_column :stores, :price
    remove_column :stores, :logo_updated_at
    remove_column :stores, :logo_file_size
    remove_column :stores, :logo_content_type
    remove_column :stores, :logo_file_name
  end
end
