require 'rails_helper'

describe "merchants/:id/favorite_customer endpoint" do
  it "returns customer with the most successful transactions for specific merchant" do
    create(:merchant, id:1)
    create(:customer, id:1, first_name:"bob")
    create(:customer, id:2, first_name:"hambone")

    create(:invoice, id:1, customer_id: 1, merchant_id:1)
    create(:invoice, id:2, customer_id: 1, merchant_id:1)
    create(:invoice, id:3, customer_id: 2, merchant_id:1)
    create(:transaction, invoice_id: 1, result: "success")
    create(:transaction, invoice_id: 2, result: "success")
    create(:transaction, invoice_id: 3, result: "success")

    get '/api/v1/merchants/1/favorite_customer'

    customer = JSON.parse(response.body)

    expect(response).to be_success

    expect(customer["id"]).to eq(1)
    expect(customer["id"]).to_not eq(2)
  end
end
