class Api::V1::Invoices::RandomInvoicesController < ApplicationController

  def show
    render json: Invoice.random
  end
end
