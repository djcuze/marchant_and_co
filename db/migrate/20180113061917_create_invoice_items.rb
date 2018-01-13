class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.belongs_to :invoice
      t.integer :quantity
      t.float :cost

      t.timestamps
    end
  end
end
