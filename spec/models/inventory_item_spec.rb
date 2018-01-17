require 'rails_helper'

RSpec.describe InventoryItem, type: :model do
  subject { described_class.new }

  context 'given a description' do
    before(:each) do
      subject.description = 'foo bar baz'
      subject.category = FactoryBot.build(:category)
    end

    it 'is valid' do
      expect(subject).to be_valid
    end
  end
  context 'without attributes' do
    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'given inventory items' do
    before(:each) { subject.invoice_items << FactoryBot.build(:invoice_item, quantity: 5) }

    it 'calculates its quantity' do
      expect(subject.quantity).to eq(5)
    end
  end
end