class AddRecipesCountToRecipeCategories < ActiveRecord::Migration
  def self.up
    add_column :recipe_categories, :recipes_count, :integer
  end

  def self.down
    remove_column :recipe_categories, :recipes_count
  end
end
