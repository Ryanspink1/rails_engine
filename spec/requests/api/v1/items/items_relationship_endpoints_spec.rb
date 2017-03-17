require 'rails_helper'

describe "when user visits items invoice items endpoint" do
  it "it displays all invoice item records associated with single item" do
    item = create(:item)
    item_2 = create(:item)
    create_list(:invoice_item, 5, item: item)
    other_invoice_item = create(:invoice_item)

    get "/api/v1/items/#{item.id}/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(5)
    expect(invoice_items.count).to_not eq(6)

    invoice_items.each do |invoice_item|
      expect(invoice_item["item_id"]).to eq(item.id)
      expect(invoice_item["item_id"]).to_not eq(item_2.id)
    end
   end
 end

describe "when user visits items merchant endpoint" do
  it "it displays the merchant records associated with single item" do
    id = create(:merchant, name: "Purple Unicorn").id
    item = create(:item, merchant_id: id)

    get "/api/v1/items/#{item.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq "Purple Unicorn"
    expect(merchant["id"]).to eq(id)
  end
end
