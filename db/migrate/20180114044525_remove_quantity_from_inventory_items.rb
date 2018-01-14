class RemoveQuantityFromInventoryItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :inventory_items, :quantity
  end
end
