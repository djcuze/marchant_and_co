class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  validates_presence_of :quantity, :cost
end
