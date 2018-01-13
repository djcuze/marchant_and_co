class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :inventory_item
  validates_presence_of :quantity, :cost, :inventory_item_id, :invoice_id
end
