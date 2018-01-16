class InvoiceParams

  def self.call(params)
    invoice = Invoice.new(supplier_id: params[:supplier_id])
    params[:invoice_items_attributes].each do |key, attribute|
      inventory_item = InventoryItem.find_or_initialize_by(description: attribute[:inventory_item_attributes][:description])
      inventory_item.category_name = attribute[:inventory_item_attributes][:category_name]
      inventory_item.save!

      invoice_item = InvoiceItem.new(quantity: attribute[:quantity], cost: attribute[:cost])
      invoice_item.inventory_item = inventory_item
      invoice_item.invoice = invoice
      invoice_item.save!
    end
    invoice.save!
    @invoice = invoice
  end
end