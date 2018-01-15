class Category < ApplicationRecord
  has_many :inventory_items
  validates_presence_of :name
end