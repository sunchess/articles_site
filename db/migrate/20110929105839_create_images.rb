class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :user_id
      t.boolean :hidden
      t.string :pic_file_name
      t.string :pic_content_type 
      t.integer :pic_file_size
      t.datetime :pic_updated_at
    end
    add_index :imgaes, :user_id
  end

  def self.down
    remove_index :images, :column => :pic_content_type
    remove_index :images, :column => :pic_file_name
    drop_table :images
  end
end
