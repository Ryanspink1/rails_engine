class Api::V1::BestDayItemsController < ApplicationController

  def show
    days = InvoiceItem.where(invoice_id: params[:item_id].to_i)
    render json: days.group(:created_at).count
