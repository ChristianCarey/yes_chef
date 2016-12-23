class AddImageProcessingToMenuItem < ActiveRecord::Migration[5.0]
  def self.up
    add_column :menu_items, :image_processing, :boolean
  end

  def self.down
    remove_column :menu_items, :image_processing
  end
end
