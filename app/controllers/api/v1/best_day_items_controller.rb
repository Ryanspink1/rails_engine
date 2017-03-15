class Api::V1::BestDayItemsController < ApplicationController

  def show
    render json: Item.find(params[:id]).best_day
  end

end
