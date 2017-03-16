require 'rails_helper'

describe 'customer id transactions endpoint' do
  it 'shows list of transactions belonging to single customer' do

    create(:customer, id: 1)
    create(:invoice, id: 1, customer_id: 1)
    create(:invoice, id: 2, customer_id: 1)
    create(:transaction, invoice_id: 1, credit_card_number: "4410437213033941")
    create(:transaction, invoice_id: 2, credit_card_number: "4136371009523904")

    get '/api/v1/customers/1/transactions'

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(2)

    expect(transactions.first["credit_card_number"]).to eq("4410437213033941")
    expect(transactions.first["credit_card_number"]).to_not eq("4136371009523847")
    expect(transactions.last["credit_card_number"]).to eq("4136371009523904")
    expect(transactions.last["credit_card_number"]).to_not eq("4136371009523829")

  end
end
