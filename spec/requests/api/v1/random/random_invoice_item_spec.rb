require 'rails_helper'

describe "invoice_item random finder" do
  it "will return a random invoice item instance" do
    create_list(:invoice_item, 20)

    get "/api/v1/invoice_items/random"

    invoice_item = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice_item).to have_key "id"
    expect(invoice_item).to have_key "item_id"
    expect(invoice_item).to have_key "invoice_id"
    expect(invoice_item).to have_key "quantity"
    expect(invoice_item).to have_key "unit_price"
  end
end
