require 'rails_helper'

describe 'transaction id invoices endpoints' do
  it 'shows the invoice belonging to single transaction' do
    invoice = create(:invoice, id:1)
    create(:transaction, invoice_id: 1)

    get '/api/v1/transactions/1/invoice'

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(4)

    expect(invoices["merchant_id"]).to eq(invoice.merchant_id)
    expect(invoices["customer_id"]).to eq(invoice.customer_id)
    expect(invoices["id"]).to eq(1)
  end
end
