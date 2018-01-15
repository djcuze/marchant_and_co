class AddCategoryToInventoryItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :inventory_items, :category, index: true
  end
end
