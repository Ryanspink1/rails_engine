require 'rails_helper'

describe "merchants/most_revenue?quantity=x endpoint" do
  it "returns top merchant ranked by total revenue" do
    create(:merchant, id:1)
    create(:invoice, id: 1, merchant_id: 1)
    create(:invoice_item, id: 1, invoice_id: 1, quantity: 10, unit_price: 10)

    create(:merchant, id:2)
    create(:invoice, id: 2, merchant_id: 2)
    create(:invoice_item, id: 2, invoice_id: 2, quantity: 9, unit_price: 9)

    create(:merchant, id:3)
    create(:invoice, id: 3, merchant_id: 3)
    create(:invoice_item, id: 3, invoice_id: 3, quantity: 8, unit_price: 8)

    get '/api/v1/merchants/most_revenue?quantity=1'

    merchants = JSON.parse(response.body)

    expect(response).to be_success

    expect(merchants.first["id"]).to eq(1)
    expect(merchants.first["id"]).to_not eq(2)
    expect(merchants.count).to eq(1)
  end

  it "returns top x merchants ranked by total revenue" do
    create(:merchant, id:1)
    create(:invoice, id: 1, merchant_id: 1)
    create(:invoice_item, id: 1, invoice_id: 1, quantity: 10, unit_price: 10)

    create(:merchant, id:2)
    create(:invoice, id: 2, merchant_id: 2)
    create(:invoice_item, id: 2, invoice_id: 2, quantity: 9, unit_price: 9)

    create(:merchant, id:3)
    create(:invoice, id: 3, merchant_id: 3)
    create(:invoice_item, id: 3, invoice_id: 3, quantity: 8, unit_price: 8)

    get '/api/v1/merchants/most_revenue?quantity=3'

    merchants = JSON.parse(response.body)

    expect(response).to be_success

    expect(merchants.count).to eq(3)

    expect(merchants.first["id"]).to eq(1)
    expect(merchants.first["id"]).to_not eq(2)
    expect(merchants.second["id"]).to eq(2)
    expect(merchants.second["id"]).to_not eq(3)
    expect(merchants.third["id"]).to eq(3)
    expect(merchants.third["id"]).to_not eq(1)
  end
end
