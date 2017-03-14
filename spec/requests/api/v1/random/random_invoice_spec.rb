require 'rails_helper'

describe "invoice random finder" do
  it "will return a random invoice item instance" do
    create_list(:invoice, 20)

    get "/api/v1/invoices/random"

    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice).to have_key "id"
    expect(invoice).to have_key "customer_id"
    expect(invoice).to have_key "merchant_id"
  end
end
