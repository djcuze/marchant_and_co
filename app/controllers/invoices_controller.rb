class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :destroy, :update]

  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

end