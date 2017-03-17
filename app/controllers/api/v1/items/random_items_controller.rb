class Api::V1::Items::RandomItemsController < ApplicationController

  def show
    render json: Item.random
  end
end
