class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :category_id
      t.string :name
      t.text :body

      t.timestamps
    end

    add_index :articles, :category_id
  end

  def self.down
    drop_table :articles
  end
end
