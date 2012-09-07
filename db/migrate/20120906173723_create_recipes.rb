class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :user_name
      t.string :title
      t.text :body
      t.boolean :shown, :defuelt => false, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
