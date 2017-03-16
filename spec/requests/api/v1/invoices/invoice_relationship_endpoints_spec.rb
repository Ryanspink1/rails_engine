require 'rails_helper'

describe "when user visits invoices transaction url" do
  it "returns transaction records related to a single invoice" do
    invoice = create(:invoice)
    create_list(:transaction, 3, invoice: invoice)
    create_list(:transaction, 3)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(3)
    expect(transactions.count).to_not eq(6)
  end
end
