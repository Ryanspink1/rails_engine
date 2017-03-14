require 'rails_helper'

describe "transaction random finder" do
  it "will return a random transaction instance" do
    create_list(:transaction, 20)

    get "/api/v1/transactions/random"

    transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(transaction).to have_key "id"
    expect(transaction).to have_key "invoice_id"
    expect(transaction).to have_key "credit_card_number"
    expect(transaction).to have_key "result"
  end
end
