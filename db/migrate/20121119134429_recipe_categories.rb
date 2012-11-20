class RecipeCategories < ActiveRecord::Migration
  def self.up
    create_table :recipe_categories do |t|
      t.string :name
    end
    add_index :recipe_categories, :name
  end

  def self.down
    drop_table :recipe_categories
  end
end
