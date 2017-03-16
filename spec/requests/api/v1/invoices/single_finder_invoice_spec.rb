require 'rails_helper'

describe "find uri" do
  it "returns single invoice" do
    create(:invoice, id:1)

    get "/api/v1/invoices/find?id=1"

    expect(response).to be_success

    invoice = JSON.parse(response.body)
# byebug
    expect(invoice).to have_key "merchant_id"
    expect(invoice).to have_key "customer_id"

  end
end
