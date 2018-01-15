class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :destroy, :update]

  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
    @invoice.invoice_items.build
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save!
        format.html { redirect_to @invoice, notice: 'You have successfully created an invoice!' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
    end
  end

  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:supplier_id, :invoice_item_id, invoice_items_attributes: [:cost, :quantity, :_destroy, :invoice_id, :inventory_item_id, inventory_item_attributes: [:description, :quantity, :_destroy, :id, :category_id]])
  end

end