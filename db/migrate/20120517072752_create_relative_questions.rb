class CreateRelativeQuestions < ActiveRecord::Migration
  def self.up
    create_table :relative_questions do |t|
      t.integer :question_id
      t.integer :relative_id
    end

    add_index :relative_questions, :question_id
    add_index :relative_questions, :relative_id
  end

  def self.down
    drop_table :relative_questions
  end
end
