class InventoryItem < ApplicationRecord
  has_many :invoice_items, dependent: :destroy
  belongs_to :category
  validates_presence_of :description
  # validates_uniqueness_of :description, :case_sensitive => false
  validates_associated :invoice_items

  def quantity
    @quantity = invoice_items.sum(&:quantity)
  end
end
