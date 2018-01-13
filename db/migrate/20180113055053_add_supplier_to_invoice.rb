class AddSupplierToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoices, :supplier, index: true
  end
end
