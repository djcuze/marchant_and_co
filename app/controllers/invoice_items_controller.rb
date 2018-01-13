class InvoiceItemsController < ApplicationController

  def index

  end

  def new
    @invoice_item = InvoiceItem.new
  end

  def create
    puts '|    text here'
    @invoice_item = InvoiceItem.new(invoice_item_params)
  end

  private

  def invoice_item_params
    params.require(:invoice_item).permit(:cost, :quantity, :invoice_id, :inventory_item_id)
  end
end