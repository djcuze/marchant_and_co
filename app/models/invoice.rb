class Invoice < ApplicationRecord
  belongs_to :supplier
  has_many :invoice_items, dependent: :destroy
end
