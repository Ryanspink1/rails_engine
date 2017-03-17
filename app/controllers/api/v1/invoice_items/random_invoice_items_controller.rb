class Api::V1::InvoiceItems::RandomInvoiceItemsController < ApplicationController

  def show
    render json: InvoiceItem.random
  end
end
