class Api::V1::Items::ItemsMerchantController < ApplicationController

  def show
    render json: Item.find(params[:item_id]).merchant
  end
end
