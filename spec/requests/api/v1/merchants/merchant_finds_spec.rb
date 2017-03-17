require 'rails_helper'

describe "merchant single finder" do
  it "will return the single item that matches the search name" do
    create(:merchant, name: "Casey")
    create_list(:merchant, 15)

    get "/api/v1/merchants/find?name=casey"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq("Casey")
    expect(merchant).to have_key "id"
    expect(merchant).to have_key "name"
  end

  it "will return the single item that matches the search name in caps" do
    create(:merchant, name: "Casey")
    create_list(:merchant, 15)

    get "/api/v1/merchants/find?name=CASEY"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq("Casey")
    expect(merchant).to have_key "id"
    expect(merchant).to have_key "name"
  end

  it "will return the single item that matches the search id" do
    id = create(:merchant).id
    create_list(:merchant, 15)

    get "/api/v1/merchants/find?id=#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
    expect(merchant).to have_key "id"
    expect(merchant).to have_key "name"
  end

  it "will return the single item that matches the created at date" do
    create(:merchant, name: "Casey", created_at: "2012-03-27T14:54:05.000Z")
    create_list(:merchant, 15)

    get "/api/v1/merchants/find?created_at=2012-03-27T14:54:05.000Z"
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq("Casey")
    expect(merchant).to have_key "id"
    expect(merchant).to have_key "name"
  end
end

describe "merchant multi-finder" do
  it "returns all matches for the given id query" do
    id = create(:merchant).id
    create_list(:merchant, 15)

    get "/api/v1/merchants/find_all?id=#{id}"

    merchant = JSON.parse(response.body)[0]

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
    expect(merchant).to have_key "id"
    expect(merchant).to have_key "name"
  end

  it "returns all matches for the given name query" do
    create_list(:merchant, 7, name: "Casey")
    create(:merchant, name: "Ryan")

    get "/api/v1/merchants/find_all?name=Casey"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.count).to eq(7)
  end

  it "returns all matches for the given created_at time query" do
    create_list(:merchant, 7, updated_at: "2012-03-27T14:54:05.000Z")
    create_list(:merchant, 3)

    get "/api/v1/merchants/find_all?updated_at=2012-03-27T14:54:05.000Z"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.count).to eq(7)
  end
end
