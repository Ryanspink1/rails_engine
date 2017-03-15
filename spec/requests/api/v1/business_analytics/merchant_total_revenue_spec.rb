require 'rails_helper'

describe "when you visit a merchants revenue page" do
  it "returns the merchant's total revenue" do
    merchant = create(:merchant)
    create_list(:invoice, 5, merchant: merchant)
    Invoice.all.each do |invoice|
      create_list(:transaction, 3, invoice: invoice, result: 'success')
      create_list(:invoice_item, 2, invoice: invoice)
    end

    get "/api/v1/merchants/#{merchant.id}/revenue"

    revenue = JSON.parse(response.body)["revenue"]

    expect(response).to be_success
    expect(revenue).to eq("0.3")
  end

  # it "returns a single merchant's total revenue for a specific date" do
  #   merchant = create(:merchant)
  #   create_list(:invoice, 5, merchant: merchant, created_at: "2012-03-27T14:54:05.000Z")
  #   Invoice.all.each do |invoice|
  #     create_list(:transaction, 3, invoice: invoice, result: 'success')
  #     create_list(:invoice_item, 2, invoice: invoice)
  #   end
  #   other_invoice = create(:invoice, 5, merchant: merchant, created_at: "2017-04-27T14:54:05.000Z")
  #   create(:transaction, invoice: other_invoice, result: "success"
  # end
end
