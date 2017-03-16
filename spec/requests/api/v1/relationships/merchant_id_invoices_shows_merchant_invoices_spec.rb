require 'rails_helper'

describe 'merchant id invoices endpoint' do
  it 'shows list of invoices belonging to single merchant' do

    create(:merchant, id: 1)
    create(:invoice, merchant_id: 1)
    create(:invoice, merchant_id: 1)
    create(:invoice, merchant_id: 1)
    create(:invoice, merchant_id: 1)
    create(:invoice, merchant_id: 1)

    get '/api/v1/merchants/1/invoices'

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(5)

    invoices.each do |invoice|
      expect(invoices["merchant_id"]).to eq(1)
    end
  end
end
