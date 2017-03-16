require 'rails_helper'

describe "when user visits invoice's transaction endpoint" do
  it "returns transaction records related to a single invoice" do
    invoice = create(:invoice)
    create_list(:transaction, 3, invoice: invoice)
    create_list(:transaction, 3)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(3)
    expect(transactions.count).to_not eq(6)

    transactions.each do |transaction|
      expect(transaction["invoice_id"]).to eq(invoice.id)
    end
  end
end

  describe "when user visits invoice's invoice items endpoint" do
    it "returns invoice item records related to a single invoice" do
      invoice = create(:invoice)
      create_list(:invoice_item, 3, invoice: invoice)
      create_list(:invoice_item, 3)

      get "/api/v1/invoices/#{invoice.id}/invoice_items"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq(3)
      expect(invoice_items.count).to_not eq(6)
      invoice_items.each do |invoice_item|
        expect(invoice_item["invoice_id"]).to eq(invoice.id)
      end
    end
  end

  describe "when user visits invoice's items endpoint" do
    it "returns item records related to a single invoice" do
      invoice = create(:invoice)
      create_list(:invoice_item, 3, invoice: invoice)
      create_list(:invoice_item, 3)

      get "/api/v1/invoices/#{invoice.id}/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(3)
      expect(items.count).to_not eq(6)
    end
  end

  describe "when user visits invoice's customer endpoint" do
    it "returns customer record related to a single invoice" do
      id = create(:customer,
                          first_name: "Purple",
                          last_name: "Unicorn"
                        ).id
      invoice = create(:invoice, customer_id: id)

      get "/api/v1/invoices/#{invoice.id}/customer"

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer["first_name"]).to eq "Purple"
      expect(customer["last_name"]).to eq "Unicorn"
      expect(customer["id"]).to eq(id)
    end
  end

  describe "when user visits invoice's merchant endpoint" do
    it "returns merchant record related to a single invoice" do
      id = create(:merchant, name: "Purple Unicorn").id
      invoice = create(:invoice, merchant_id: id)

      get "/api/v1/invoices/#{invoice.id}/merchant"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["name"]).to eq "Purple Unicorn"
      expect(merchant["id"]).to eq(id)
    end
  end
