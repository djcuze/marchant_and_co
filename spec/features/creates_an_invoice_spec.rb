require 'rails_helper'

RSpec.describe 'Creating an invoice' do
  let!(:supplier) { FactoryBot.create(:supplier) }
  let!(:inventory_item) { FactoryBot.build(:inventory_item) }

  feature 'creates an invoice' do

    scenario 'with valid items' do
      create_invoice_with(inventory_item)
      expect(page).to have_content('You have successfully created an invoice!')
    end

    it 'increases the inventory_item count by 1' do
      expect { create_invoice_with(inventory_item) }.to change { InventoryItem.count }.by(1)
    end

    def create_invoice_with(inventory_item)
      visit new_invoice_path
      select(supplier.name, :from => 'invoice_supplier_id')
      fill_in 'Quantity', with: '5'
      fill_in 'Cost', with: '5'
      fill_in 'Item Description', with: inventory_item
      click_button 'Create Invoice'
    end
  end
end