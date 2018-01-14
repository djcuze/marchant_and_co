class UpdateInventoryItemQuantity
  def self.call(item, value)
    item.quantity += value
  end
end