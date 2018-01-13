class AddInventoryItemsToInvoiceItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoice_items, :inventory_item, index: true
  end
end
