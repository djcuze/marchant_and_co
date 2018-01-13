class UpdateInventoryItemQuantity
  def self.call(invoice_item, inventory_item)
    inventory_item.quantity += invoice_item.quantity
  end
end