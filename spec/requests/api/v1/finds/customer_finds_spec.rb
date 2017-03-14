require 'rails_helper'

describe "customer single finder" do
  it "will return the single item that matches the first name query" do
    create(:customer, first_name: "Casey")
    create_list(:customer, 15)

    get "/api/v1/customers/find?first_name=casey"


    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq("Casey")
    expect(customer).to have_key "id"
    expect(customer).to have_key "first_name"
    expect(customer).to have_key "last_name"
  end

  it "will return the single item that matches the last name query" do
    create(:customer, last_name: "Macaulay")
    create_list(:customer, 15)

    get "/api/v1/customers/find?last_name=macAULAY"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["last_name"]).to eq("Macaulay")
    expect(customer).to have_key "id"
    expect(customer).to have_key "first_name"
    expect(customer).to have_key "last_name"
  end

  it "will return the single item that matches the search id" do
    id = create(:customer).id
    create_list(:customer, 15)

    get "/api/v1/customers/find?id=#{id}"


    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
    expect(customer).to have_key "id"
    expect(customer).to have_key "first_name"
    expect(customer).to have_key "last_name"
  end

  it "will return the single item that matches the created at date" do
    create(:customer, first_name: "Casey", created_at: "2012-03-27T14:54:05.000Z")
    create_list(:customer, 15)

    get "/api/v1/customers/find?created_at=2012-03-27T14:54:05.000Z"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq("Casey")
    expect(customer).to have_key "id"
    expect(customer).to have_key "first_name"
    expect(customer).to have_key "last_name"
  end

end

describe "customer multi-finder" do
  it "returns all matches for the given id query" do
    id = create(:customer).id
    create_list(:customer, 15)

    get "/api/v1/customers/find_all?id=#{id}"

    customer = JSON.parse(response.body)[0]

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
    expect(customer).to have_key "id"
    expect(customer).to have_key "first_name"
    expect(customer).to have_key "last_name"
  end

  it "returns all matches for the given first name query" do
    create_list(:customer, 7, first_name: "Casey")
    create(:customer, first_name: "Ryan")

    get "/api/v1/customers/find_all?first_name=Casey"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.count).to eq(7)
  end

  it "returns all matches for the given last name query" do
    create_list(:customer, 7, last_name: "Spink")
    create(:customer, last_name: "Ryan")

    get "/api/v1/customers/find_all?last_name=SPINK"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.count).to eq(7)
  end

  it "returns all matches for the given created_at time query" do
    create_list(:customer, 7, updated_at: "2012-03-27T14:54:05.000Z")
    create_list(:customer, 3)

    get "/api/v1/customers/find_all?updated_at=2012-03-27T14:54:05.000Z"

    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.count).to eq(7)
  end
end
