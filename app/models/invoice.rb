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

  def category
    Category.most_popular_for_invoice(id).capitalize
  end

  # Itemised Expenditures.
  # ie. Year-To-Date spend on a particular InventoryItem

  # Possible separation gotcha! with calculating Profit of a product.
  # Inventory Item needs to somehow link back to an invoice_item
  #
  # Product.new( cost: 12, quantity: 11, invoice_item: InvoiceItem[0] )
  #
  # When creating a product, assign the earliest available inventory_item


end
