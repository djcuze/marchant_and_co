FactoryBot.define do

  factory :supplier do
    name 'Giver of Foo'
  end

  factory :invoice do
    supplier FactoryBot.build(:supplier)
    end
  factory :inventory_item do
    description 'foo bar baz'
  end
end