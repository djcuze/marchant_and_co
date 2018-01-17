FactoryBot.define do

  factory :supplier do
    name 'Giver of Foo'
  end

  factory :invoice do
    supplier FactoryBot.build(:supplier)
  end

  factory :category do
    name 'Categoric'
  end

  factory :inventory_item do
    description 'foo bar baz'
    category FactoryBot.build(:category)
  end

  factory :invoice_item do
    inventory_item FactoryBot.build(:inventory_item)
    cost 5.99
  end
end