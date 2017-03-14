class Api::V1::Merchants::FindMerchantsController < ApplicationController

  def index
  end

  def show
    render json: Merchant.find_by(item_params)
  end

private

  def item_params
    params.permit(:id, :name, :updated_at, :created_at)
  end
end
