class Api::V1::Customers::RandomCustomersController < ApplicationController

  def show
    render json: Customer.random
  end

end
