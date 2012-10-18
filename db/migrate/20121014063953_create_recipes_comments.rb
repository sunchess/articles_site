class CreateRecipesComments < ActiveRecord::Migration
  def self.up
    create_table :recipes_comments do |t|
      t.integer :recipe_id
      t.string :email
      t.string :user_name
      t.text :body
      t.boolean :shown, :null => false, :default => false

      t.timestamps
    end

    add_index :recipes_comments, :recipe_id
  end

  def self.down
    drop_table :recipes_comments
  end
end
