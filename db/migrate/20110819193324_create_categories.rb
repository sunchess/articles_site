class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
    end
    add_index :categories, :name
  end

  def self.down
    remove_index :categories, :column => :name
    drop_table :categories
  end
end
