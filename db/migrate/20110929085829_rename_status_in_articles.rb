class RenameStatusInArticles < ActiveRecord::Migration
  def self.up
    rename_column :articles, :status, :aasm_status
  end

  def self.down
    rename_column :articles, :aasm_status, :status
  end
end
