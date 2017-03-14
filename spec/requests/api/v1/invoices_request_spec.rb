require 'rails_helper'

describe 'invoice API' do
  it 'sends a list of invoices' do
    create_list(:customer, 3)
    create_list(:merchant, 3)
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)
  end

  it 'sends a single invoice' do
    customer = create(:customer)
    merchant = create(:merchant)
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success

    expect(invoice).to have_key "customer_id"
    expect(invoice).to have_key "merchant_id"
    expect(invoice["customer_id"]).to_not eq(3)
    expect(invoice["merchant_id"]).to_not eq(3)
  end
end
