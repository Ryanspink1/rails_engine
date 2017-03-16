require 'rails_helper'

describe "when you visit the items most items endpoint" do
  it "returns 3 items ranked by total number sold" do
    item_1 = create(:item, name: "Book")
    item_2 = create(:item, name: "Movie")
    item_3 = create(:item, name: "Magazine")
    invoice = create(:invoice)
    Item.all.each do |item|
      create_list(:invoice_item, 4, invoice: invoice, item: item)
      create_list(:transaction, 12, invoice: invoice)
    end

    other_item = create(:item, name: "Other")
    other_invoice = create(:invoice)
    create(:invoice_item, invoice: other_invoice, item: other_item)
    create_list(:transaction, 8, invoice: other_invoice)

    get "/api/v1/items/most_items?quantity=3"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq 3

    expected_names = items.any? do |item|
      item["name"] == "Book" || "Movie" || "Magazine"
      item["name"] != "Other"
    end
  end
end
