class Api::V1::Customers::CustomerTransactionListController < ApplicationController

  def show
    render json: Customer.find(params[:customer_id]).transactions
  end
end
