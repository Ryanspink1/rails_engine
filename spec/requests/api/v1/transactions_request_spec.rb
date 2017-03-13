require 'rails_helper'

describe "transactions API" do
  it "sends a list of transactions" do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it "can get one transaction by its id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)
    expected_card_number = Transaction.find(id).credit_card_number

    expect(response).to be_success
    expect(transaction).to have_key "credit_card_number"
    expect(transaction["credit_card_number"]).to eq(expected_card_number)
    expect(transaction["id"]).to eq(id)
    expect(transaction).to have_key "result"
    expect(transaction).to have_key "invoice_id"
  end
end
