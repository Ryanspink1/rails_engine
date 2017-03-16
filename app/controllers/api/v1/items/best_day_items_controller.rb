class Api::V1::Items::BestDayItemsController < ApplicationController

  def show
    render json:{best_day: Item.find(params[:item_id]).best_day}
  end

end
