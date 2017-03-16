require 'rails_helper'

describe "find_all uri" do
  it "returns all invoices with status shipped" do
    create_list(:invoice, 3)

    get "/api/v1/invoices/find_all?status=shipped"

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(3)

  end

  it "returns invoices from creation date" do

    create_list(:invoice, 4, created_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/invoices/find_all?created_at=2012-03-27T14:54:05.000Z"
    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(4)

  end
end
