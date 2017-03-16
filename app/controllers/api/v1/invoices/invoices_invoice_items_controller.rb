class Api::V1::Invoices::InvoicesInvoiceItemsController < ApplicationController

  def show
    render json: Invoice.find(params[:invoice_id]).invoice_items
  end

end
