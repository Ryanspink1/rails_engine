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
end
