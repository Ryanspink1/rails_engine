class Api::V1::Merchants::MerchantsRevenueController < ApplicationController

  def show
    render json: {revenue: Merchant.find(params[:merchant_id]).total_revenue}, :serializer => MerchantRevenueSerializer
  end

end
