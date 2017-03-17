require 'rails_helper'

describe "customers API" do
  it "sends a list of customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer).to have_key "first_name"
    expect(customer).to have_key "last_name"
    expect(customer["first_name"]).to eq("Sean")
    expect(customer["last_name"]).to eq("Connery")
    expect(customer["id"]).to eq(id)
  end
end
