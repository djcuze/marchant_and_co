# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

suppliers = Supplier.create([
  { name: 'foo' },
  { name: 'bar' }])

inventory_item = InventoryItem.create!(
  description: 'bat'
)

invoice = Invoice.create!(
  supplier: suppliers.first
)

categories = Category.create([
  { name: 'pots' },
  { name: 'plants' },
  { name: 'other' }
])

InvoiceItem.create!(
  inventory_item: inventory_item,
  invoice: invoice,
  quantity: 10,
  cost: 5.99)