require 'features/invoice_params'

class InvoicesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_invoice, only: [:show, :edit, :destroy, :update]

  def index
    params[:sort] ||= 'id'
    @invoices = Invoice.order(sort_column + " " + sort_direction)
  end

  def new
    @invoice = Invoice.new
    @invoice.invoice_items.build
  end

  def edit
  end

  def create
    @invoice = InvoiceParams.call(invoice_params)
    respond_to do |format|
      if @invoice.save!
        format.html { redirect_to @invoice, notice: 'You have successfully created an invoice!'}
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
    params.require(:invoice).permit(:invoice_number, :received_on_date, :supplier_id, :invoice_item_id, invoice_items_attributes: [:cost, :quantity, :_destroy, :invoice_id, :inventory_item_id, inventory_item_attributes: [:description, :_destroy, :id, :category_id, :category_name]])
  end

  def sort_column
    params[:sort] || 'id'
  end

  def sort_direction
    params[:direction] || 'asc'
  end
end