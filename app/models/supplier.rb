class Supplier < ApplicationRecord
  has_many :invoices

  validates_presence_of :name
end
