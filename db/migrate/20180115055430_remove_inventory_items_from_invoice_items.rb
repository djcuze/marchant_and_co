class RemoveInventoryItemsFromInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    remove_reference :invoice_items, :inventory_items, index: true
  end
end
