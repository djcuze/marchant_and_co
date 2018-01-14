require 'rails_helper'

RSpec.describe InventoryItem, type: :model do
  subject { described_class.new }

  context 'given a description' do
    before(:each) do
      subject.description = 'foo bar baz'
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
end