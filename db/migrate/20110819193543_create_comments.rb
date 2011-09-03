class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :article_id
      t.string :body
      t.integer :parent_id

      t.timestamps
    end
    add_index :comments, :article_id
    add_index :comments, :parent_id
  end

  def self.down
    drop_table :comments
  end
end
