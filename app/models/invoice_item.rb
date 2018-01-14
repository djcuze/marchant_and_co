class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :inventory_item
  validates_presence_of :quantity, :cost, :inventory_item
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :cost, numericality: true
  accepts_nested_attributes_for :inventory_item, reject_if: :all_blank, allow_destroy: true
  validates_associated :inventory_item

  def calculated_total
    cost * quantity
  end
end
