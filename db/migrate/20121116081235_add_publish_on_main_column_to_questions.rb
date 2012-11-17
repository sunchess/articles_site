class AddPublishOnMainColumnToQuestions < ActiveRecord::Migration
  def self.up
  	add_column :questions, :publish_on_main, :boolean
  end

  def self.down
  	remove_column :questions, :publish_on_main
  end
end
