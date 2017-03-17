require 'rails_helper'

describe "when user visits invoice items invoice endpoint" do
  it "it displays the invoice record associated with single invoice item" do
    id = create(:invoice).id
    invoice_item = create(:invoice_item, invoice_id: id)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end
end

describe "when user visits invoice items item endpoint" do
  it "it displays the item record associated with single invoice item" do
    id = create(:item).id
    invoice_item = create(:invoice_item, item_id: id)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end
end
