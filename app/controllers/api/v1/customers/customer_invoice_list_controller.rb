class Api::V1::Customers::CustomerInvoiceListController < ApplicationController

  def index
    render json: Customer.find(params[:customer_id]).invoices
  end
end
