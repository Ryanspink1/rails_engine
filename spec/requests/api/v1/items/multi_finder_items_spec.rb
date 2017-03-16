require 'rails_helper'

describe "find_all uri" do
  it "returns item from name" do
    create_list(:merchant, 4)
    create_list(:item, 4)

    get "/api/v1/items/find_all?name=MoonBoot"
    expect(response).to be_success

    item = JSON.parse(response.body)[0]

    expect(item).to have_key "name"
    expect(item).to have_key "description"
    expect(item).to have_key "unit_price"
    expect(item).to have_key "merchant_id"

    expect(item["name"]).to eq("MoonBoot")
    expect(item["name"]).to_not eq("MoonBoot4")
  end

  it "returns items from creation date" do
    create_list(:merchant, 4)
    create_list(:item, 4, created_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/items/find_all?created_at=2012-03-27T14:54:05.000Z"
    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(4)

  end
end
