class PositionOnArticles < ActiveRecord::Migration
  def self.up
    Article.order(:id).each_with_index do |a, i|
      a.position = i + 1
      a.save
    end
  end

  def self.down
    Article.update_all(:position => 0)
  end
end
