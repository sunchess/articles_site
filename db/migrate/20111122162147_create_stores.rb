class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.string  :name
      t.text    :description
      t.string  :where_from
      t.integer :honey_sort
      t.boolean :on_index, :default => false, :null => false
      t.boolean :on_top, :default => false, :null => false
      t.boolean :shown, :default => true, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :stores
  end
end
