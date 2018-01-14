class InventoryItem < ApplicationRecord
  has_many :invoice_items, dependent: :destroy
  validates_presence_of :description
  validates_associated :invoice_items

  def quantity
    @quantity = invoice_items.sum(&:quantity)
  end
end
