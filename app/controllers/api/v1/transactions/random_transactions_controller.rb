class Api::V1::Transactions::RandomTransactionsController < ApplicationController

  def show
    render json: Transaction.random
  end
end
