class AddRecipeCategoryIdToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :recipe_category_id, :integer
  end

  def self.down
    remove_column :recipes, :recipe_category_id
  end
end
