require 'rails_helper'

describe "customer random finder" do
  it "will return a random customer instance" do
    create_list(:customer, 20)

    get "/api/v1/customers/random"

    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer).to have_key "id"
    expect(customer).to have_key "first_name"
    expect(customer).to have_key "last_name"
  end
end
