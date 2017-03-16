class Api::V1::Items::ItemsInvoiceItemsController < ApplicationController

  def show
    render json: Item.find(params[:item_id]).invoice_items
  end

end
