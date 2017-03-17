require 'rails_helper'

describe "transaction single finder" do
  it "will return the single item that matches the invoice_id query" do
    invoice_id = create(:invoice).id
    create(:transaction, invoice_id: invoice_id)
    create_list(:transaction, 15)

    get "/api/v1/transactions/find?invoice_id=#{invoice_id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["invoice_id"]).to eq(invoice_id)
    expect(transaction).to have_key "id"
    expect(transaction).to have_key "invoice_id"
    expect(transaction).to have_key "credit_card_number"
    expect(transaction).to have_key "result"
  end

  it "will return the single item that matches the id query" do
    id = create(:transaction).id
    create_list(:transaction, 15)

    get "/api/v1/transactions/find?id=#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
    expect(transaction).to have_key "id"
    expect(transaction).to have_key "invoice_id"
    expect(transaction).to have_key "credit_card_number"
    expect(transaction).to have_key "result"
  end

  it "will return the single item that matches the credit card query" do
    create(:transaction, credit_card_number: 12345)
    create_list(:transaction, 15)

    get "/api/v1/transactions/find?credit_card_number=12345"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["credit_card_number"]).to eq("12345")
    expect(transaction).to have_key "id"
    expect(transaction).to have_key "invoice_id"
    expect(transaction).to have_key "credit_card_number"
    expect(transaction).to have_key "result"
  end

  it "will return the single item that matches the credit card query" do
    create(:transaction, result: "Failure")
    create_list(:transaction, 15)

    get "/api/v1/transactions/find?result=FAILURE"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["result"]).to eq("Failure")
    expect(transaction).to have_key "id"
    expect(transaction).to have_key "invoice_id"
    expect(transaction).to have_key "credit_card_number"
    expect(transaction).to have_key "result"
  end

  it "will return the single item that matches the created at date" do
    create(:transaction,
            credit_card_number: 12345,
            created_at: "2012-03-27T14:54:05.000Z"
          )
    create_list(:transaction, 15)

    get "/api/v1/transactions/find?created_at=2012-03-27T14:54:05.000Z"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["credit_card_number"]).to eq("12345")
    expect(transaction).to have_key "id"
    expect(transaction).to have_key "invoice_id"
    expect(transaction).to have_key "credit_card_number"
    expect(transaction).to have_key "result"
  end
end

describe "transaction multi-finder" do
  it "returns all matches for the given id query" do
    id = create(:transaction).id
    create_list(:transaction, 15)

    get "/api/v1/transactions/find_all?id=#{id}"

    transaction = JSON.parse(response.body)[0]

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
    expect(transaction).to have_key "id"
    expect(transaction).to have_key "invoice_id"
    expect(transaction).to have_key "credit_card_number"
    expect(transaction).to have_key "result"
  end

  it "returns all matches for the given invoice id query" do
    invoice_id = create(:invoice).id
    create_list(:transaction, 7, invoice_id: invoice_id)
    create_list(:transaction, 3)

    get "/api/v1/transactions/find_all?invoice_id=#{invoice_id}"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(7)
  end

  it "returns all matches for the given credit card number query" do
    create_list(:transaction, 7, credit_card_number: 12345)
    create_list(:transaction, 3)

    get "/api/v1/transactions/find_all?credit_card_number=12345"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(7)
  end

  it "returns all matches for the given credit card number query" do
    create_list(:transaction, 7)
    create_list(:transaction, 3, result: "Failure")

    get "/api/v1/transactions/find_all?result=success"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(7)
  end

  it "returns all matches for the given created_at time query" do
    create_list(:transaction, 7, updated_at: "2012-03-27T14:54:05.000Z")
    create_list(:transaction, 3)

    get "/api/v1/transactions/find_all?updated_at=2012-03-27T14:54:05.000Z"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(7)
  end
end
