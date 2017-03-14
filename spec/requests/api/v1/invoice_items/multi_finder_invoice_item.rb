require 'rails_helper'

describe "find_all uri" do
  it "returns all invoice items with same price" do
    create_list(:invoice_item, 5)

    get "/api/v1/invoice_items/find_all?unit_price=1"
    expect(response).to be_success

    invoices = JSON.parse(response.body)[0]

    expect(invoices.count).to eq(5)

  end

  it "returns invoice items from creation date" do

    create_list(:invoice_item, 4, created_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/invoice_items/find_all?created_at=2012-03-27T14:54:05.000Z"
    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(4)

  end
end
