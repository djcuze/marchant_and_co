class InventoryItem < ApplicationRecord
  has_many :invoice_items
  validates_presence_of :description
end
