class Api::V1::Merchants::MerchantsMostItemsController < ApplicationController

  def index
    render json: Merchant.most_items(params[:quantity])
  end

end
