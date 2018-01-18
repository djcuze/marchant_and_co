class Category < ApplicationRecord
  has_many :inventory_items
  validates_presence_of :name

  def self.most_popular_for_invoice(invoice_id)
    Category
      .select('categories.name, invoice_items.quantity * COUNT(categories.name) AS total')
      .joins(inventory_items: [:invoice_items])
      .where(invoice_items: { invoice_id: invoice_id })
      .group(:name)
      .order('total DESC')
      .limit(1)
      .first
      .try(:name)
  end
end