class Invoice < ApplicationRecord
  belongs_to :supplier
  has_many :invoice_items, dependent: :destroy, inverse_of: :invoice
  accepts_nested_attributes_for :invoice_items, reject_if: :all_blank, allow_destroy: true
  validates_associated :invoice_items

  def total
    @total = invoice_items.sum(&:calculated_total)
  end

  def supplier
    @supplier = Supplier.find(supplier_id)
  end
end
