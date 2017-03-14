class Api::V1::Customers::FindCustomersController < ApplicationController

  def index
    render json: Customer.where(customer_params)
  end

  def show
    render json: Customer.find_by(customer_params)
  end

private

  def customer_params
    params.permit(:id, :first_name, :last_name, :updated_at, :created_at)
  end
end
