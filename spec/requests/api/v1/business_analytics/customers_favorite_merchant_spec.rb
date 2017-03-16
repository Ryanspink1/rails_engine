require 'rails_helper'

describe "when you visit customer's favorite merchant endpoint" do
  it "it returns the merchant the customer has most often perchased from" do
    customer = create(:customer, first_name: "Purple", last_name: "Unicorn")
    merchant_1 = create(:merchant, name: "Casey")
    merchant_2 = create(:merchant, name: "Ryan")
    invoice = create(:invoice, merchant: merchant_1, customer: customer)
    invoice_2 = create(:invoice, merchant: merchant_2, customer: customer)
    create_list(:transaction, 10, invoice: invoice, result: "Success")
    create_list(:transaction, 9, invoice: invoice_2, result: "Success")

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq merchant_1.id
    expect(merchant["id"]).to_not eq merchant_2.id
    expect(merchant["name"]).to eq "Casey"
    expect(merchant["name"]).to_not eq "Ryan"
  end
end
