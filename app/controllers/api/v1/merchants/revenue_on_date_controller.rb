class Api::V1::Merchants::RevenueOnDateController < ApplicationController

  def show
    render json: {total_revenue: Merchant.revenue(params[:date])}, :serializer => MerchantRevenueOnDateSerializer
  end
end
