FactoryBot.define do

  factory :supplier do
    name 'Giver of Foo'
  end

  factory :invoice do
    supplier FactoryBot.build(:supplier)
  end
end