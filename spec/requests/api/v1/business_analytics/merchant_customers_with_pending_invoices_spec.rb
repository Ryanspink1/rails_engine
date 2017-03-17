require 'rails_helper'

describe "customers_with_pending_invoices endpoints" do
  it " returns all customers with pending invoices" do
    merchant  = create(:merchant)
    customer_1 = create(:customer, first_name: "Casey", last_name: "Macaulay")
    customer_2 = create(:customer, first_name: "Ryan", last_name: "Spink")
    invoice_1   = create(:invoice, merchant: merchant, customer: customer_1)
    invoice_2  = create(:invoice, merchant: merchant, customer: customer_2)
    create_list(:transaction, 4, result: 'failed', invoice: invoice_1)
    create_list(:transaction, 4, result: 'success', invoice: invoice_2)

    get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"

    customer = JSON.parse(response.body)[0]

    expect(response).to be_success

    expect(customer["id"]).to eq customer_1.id
    expect(customer["id"]).to_not eq customer_2.id
    expect(customer["first_name"]).to eq "Casey"
    expect(customer["first_name"]).to_not eq "Ryan"
    expect(customer["last_name"]).to eq "Macaulay"
    expect(customer["last_name"]).to_not eq "Spink"
  end
end
