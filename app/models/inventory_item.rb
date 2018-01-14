class InventoryItem < ApplicationRecord
  has_many :invoice_items
  validates_presence_of :description

  def quantity
    @quantity = invoice_items.sum(&:quantity)
  end
end
