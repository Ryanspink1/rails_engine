class Api::V1::Merchants::MerchantItemListController < ApplicationController

  def show
    render json: Merchant.find(params[:merchant_id]).items
  end
end
