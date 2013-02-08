class AddAttachmentCertificateToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :certificate_file_name, :string
    add_column :stores, :certificate_content_type, :string
    add_column :stores, :certificate_file_size, :integer
    add_column :stores, :certificate_updated_at, :datetime
  end

  def self.down
    remove_column :stores, :certificate_file_name
    remove_column :stores, :certificate_content_type
    remove_column :stores, :certificate_file_size
    remove_column :stores, :certificate_updated_at
  end
end
