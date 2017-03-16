class Api::V1::BestDayItemsController < ApplicationController

  def show
    render json:{best_day: Item.find(params[:item_id]).best_day}
  end

end
