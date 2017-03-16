require 'rails_helper'

describe "merchants/revenue?date=x endpoint" do
  it "returns the total revenue for date x across all merchants" do

    create(:merchant, id:1)
    create(:invoice, id: 1, merchant_id: 1, created_at: "2012-04-27T14:54:05.000Z")
    create(:invoice_item, id: 1, invoice_id: 1, quantity: 10, unit_price: 10)

    create(:merchant, id:2)
    create(:invoice, id: 2, merchant_id: 2, created_at: "2012-04-27T14:54:05.000Z")
    create(:invoice_item, id: 2, invoice_id: 2, quantity: 9, unit_price: 9)

    create(:merchant, id:3)
    create(:invoice, id: 3, merchant_id: 3, created_at: "2012-04-27T14:54:05.000Z")
    create(:invoice_item, id: 3, invoice_id: 3, quantity: 8, unit_price: 8)

    get '/api/v1/merchants/revenue?date=2012-04-27T14:54:05.000Z'

    revenue = JSON.parse(response.body)

    expect(response).to be_success

    expect(revenue["total_revenue"]).to eq("2.45")
    expect(revenue["total_revenue"]).to_not eq("2.44")
  end
end
