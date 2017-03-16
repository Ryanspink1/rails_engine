class Api::V1::Invoices::InvoicesItemsController < ApplicationController

  def show
    render json: Invoice.find(params[:invoice_id]).items
  end

end
