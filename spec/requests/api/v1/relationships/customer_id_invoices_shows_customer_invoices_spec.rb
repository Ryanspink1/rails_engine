require 'rails_helper'

describe 'customer id invoices endpoint' do
  it 'shows list of invoices belonging to single customer' do

    create(:customer, id: 1)
    create(:invoice, customer_id: 1)
    create(:invoice, customer_id: 1)
    create(:invoice, customer_id: 1)
    create(:invoice, customer_id: 1)
    create(:invoice, customer_id: 1)
    create(:invoice, customer_id: 1)

    get '/api/v1/customers/1/invoices'

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(6)

    invoices.each do |invoice|
      expect(invoice["customer_id"]).to eq(1)
    end
  end
end
