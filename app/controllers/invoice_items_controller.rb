class InvoiceItemsController < ApplicationController
  before_action :set_invoice_item, only: [:show, :edit, :update, :destroy]

  def index
    @invoice_items = InvoiceItem.all
  end

  def new
    @invoice_item = InvoiceItem.new
  end

  def create
    @invoice_item = InvoiceItem.new(invoice_item_params)
    respond_to do |format|
      if @invoice_item.save!
        format.html { redirect_to @invoice_item, notice: 'Invoice Item was successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @invoice_item.destroy
    respond_to do |format|
      format.html { redirect_to invoice_items_url, notice: 'Invoice Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_invoice_item
    @invoice_item = InvoiceItem.find(params[:id])
  end

  def invoice_item_params
    params.require(:invoice_item).permit(:cost, :quantity, :invoice_id, :inventory_item_id, inventory_item_attributes: [:description, :quantity, :_destroy, :id])
  end
end