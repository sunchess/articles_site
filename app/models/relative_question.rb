class RelativeQuestion < ActiveRecord::Base
  attr_accessible :question_id, :relative_id

  belongs_to :question
  belongs_to :relative, :class_name => "Question", :foreign_key => "relative_id"
end
