class AddPositionToStore < ActiveRecord::Migration
  def self.up
    add_column :stores, :position, :integer
    Store.order(:id).each_with_index do |s, i|
      s.position = i + 1
      s.save
    end
  end

  def self.down
    remove_column :stores, :position
  end
end
