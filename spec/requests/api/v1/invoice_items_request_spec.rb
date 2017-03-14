require 'rails_helper'

describe "invoice_items API" do
  it "sends a list of invoice items" do
    create_list(:customer, 2)
    create_list(:merchant, 2)
    create_list(:invoice, 2)
    create_list(:item, 2)
    create_list(:invoice_item, 2)

    get '/api/v1/invoice_items'

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(2)
  end

  it "sends a single invoice item" do
    create(:customer)
    create(:merchant)
    create(:invoice)
    create(:item)
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success

    expect(invoice_item).to have_key "invoice_id"
    expect(invoice_item).to have_key "item_id"
    expect(invoice_item).to have_key "quantity"
    expect(invoice_item).to have_key "unit_price"

    expect(invoice_item).to_not have_key "jabrony"

    expect(invoice_item["quantity"]).to eq(1)
    expect(invoice_item["unit_price"]).to eq(1)

    expect(invoice_item["quantity"]).to_not eq(2)
    expect(invoice_item["unit_price"]).to_not eq(2)
  end
end
