class AddPositionToRecipeCategories < ActiveRecord::Migration
  def self.up
    add_column :recipe_categories, :position, :integer
  end

  def self.down
    remove_column :recipe_categories, :position
  end
end
