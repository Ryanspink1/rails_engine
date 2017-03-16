class Api::V1::Invoices::InvoicesTransactionsController < ApplicationController

  def show
    render json: Invoice.find(invoice_params).transactions
  end

end
