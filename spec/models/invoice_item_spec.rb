require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  subject { described_class.new }

  context 'given a cost' do
    before(:each) do
      subject.cost = 5.99
    end

    context 'and a quantity' do
      before(:each) { subject.quantity = 10 }

      context 'and an invoice' do
        before(:each) { subject.invoice = FactoryBot.create(:invoice) }

        context 'and an inventory item' do
          before(:each) { subject.inventory_item = FactoryBot.create(:inventory_item) }
          it 'is valid' do
            expect(subject).to be_valid
          end
        end
      end
    end
  end
end