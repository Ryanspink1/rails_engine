require 'rails_helper'

describe "when you visit a merchants most items page" do
  it "returns the top 3 merchants ranked by total of items sold" do
    merchant_1 = create(:merchant, name: "Casey")
    merchant_2 = create(:merchant, name: "Alex")
    merchant_3 = create(:merchant, name: "Ryan")
    Merchant.all.each do |merchant|
      item_1 = create(:item, merchant: merchant, name: "Book")
      item_2 = create(:item, merchant: merchant, name: "Movie")
      create_list(:invoice, 3, merchant: merchant)
      Invoice.all.each do |invoice|
        create_list(:invoice_item, 3, invoice: invoice, item: item_1)
        create_list(:invoice_item, 3, invoice: invoice, item: item_2)
        create_list(:transaction, 3, invoice: invoice, result: 'success')
      end
    end
    merchant_4 = create(:merchant, name: "Other Merchant")

    get "/api/v1/merchants/most_items?quantity=3"

    most_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(most_items.count).to eq(3)

    expect(most_items[0]["id"]).to  eq merchant_1.id
    expect(most_items[1]["id"]).to eq merchant_2.id
    expect(most_items[2]["id"]).to eq merchant_3.id

    expected_names = most_items.any? do |merchant|
      merchant["name"] == "Casey" || "Alex" || "Ryan"
      merchant["name"] != "Other Merchant"
    end

    expected_ids = most_items.any? do |merchant|
      merchant["id"] == merchant_1.id || merchant_2.id || merchant_3.id
      merchant["id"] != merchant_4.id
    end

    expect(expected_names).to be_truthy
    expect(expected_ids).to be_truthy
  end

  it "returns the top merchant ranked by total of items sold" do
    merchant_1 = create(:merchant, name: "Casey")
    merchant_2 = create(:merchant, name: "Alex")
    merchant_3 = create(:merchant, name: "Ryan")
    Merchant.all.each do |merchant|
      item_1 = create(:item, merchant: merchant, name: "Book")
      item_2 = create(:item, merchant: merchant, name: "Movie")
      create_list(:invoice, 3, merchant: merchant)
      Invoice.all.each do |invoice|
        create_list(:invoice_item, 3, invoice: invoice, item: item_1)
        create_list(:invoice_item, 3, invoice: invoice, item: item_2)
        create_list(:transaction, 3, invoice: invoice, result: 'success')
      end
    end
    merchant_4 = create(:merchant, name: "Other Merchant")

    get "/api/v1/merchants/most_items?quantity=1"

    most_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(most_items.count).to eq(1)
    expect(most_items[0]["name"]).to  eq "Casey"
    expect(most_items[0]["id"]).to  eq merchant_1.id
  end
end
