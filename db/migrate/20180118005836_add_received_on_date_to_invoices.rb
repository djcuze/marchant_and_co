class AddReceivedOnDateToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :received_on_date, :date
  end
end
