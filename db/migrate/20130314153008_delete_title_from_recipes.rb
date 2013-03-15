class DeleteTitleFromRecipes < ActiveRecord::Migration
  def self.up
    remove_column :recipes, :title
  end

  def self.down
    add_column :recipes, :title, :string
  end
end
