require 'rails_helper'

RSpec.describe Supplier, type: :model do
  subject { described_class.new }

  context 'given a name' do
    before(:each) { subject.name = 'foo' }

    it 'is valid' do
      expect(subject).to be_valid
    end

    ## Integration
    it 'should have many suppliers' do
      t = Supplier.reflect_on_association(:invoices)
      expect(t.macro).to eq(:has_many)
    end
  end

  context 'without a name' do
    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end
end