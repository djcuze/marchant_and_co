class AddInventoryItemToInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoice_items, :inventory_items, index: true
  end
end
