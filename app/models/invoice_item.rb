class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :inventory_item
  validates_presence_of :quantity, :cost, :inventory_item, :invoice_id
  accepts_nested_attributes_for :inventory_item, reject_if: :all_blank, allow_destroy: true
end
