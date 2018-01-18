class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :inventory_item
  validates_presence_of :quantity, :cost, :inventory_item
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cost, numericality: true
  accepts_nested_attributes_for :inventory_item, reject_if: :all_blank, allow_destroy: true

  def calculated_total
    cost * quantity
  end

  def inventory_item_description
    InventoryItem.try(:description)
  end

  def inventory_item_description=(name)
    self.inventory_item = InventoryItem.find_or_create_by!(description: description) if description.present?
  end
end
