class Api::V1::Merchants::MerchantInvoiceListController < ApplicationController

  def index
    render json: Merchant.find(params[:merchant_id]).invoices
  end
end
