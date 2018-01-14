require 'rails_helper'
require 'factory_bot'
RSpec.describe Invoice, type: :model do
  subject { described_class.new }

  context 'given a supplier' do
    before(:each) do
      subject.supplier_id = FactoryBot.create(:supplier).id
    end
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'without a supplier' do
    it 'is invalid' do
      expect(FactoryBot.build(:supplier, name: nil)).not_to be_valid
    end
  end

end