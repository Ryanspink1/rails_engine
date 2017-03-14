require 'rails_helper'

describe "items API" do
  it "sends a list of items" do
    create_list(:merchant, 4)
    create_list(:item, 4)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(4)
  end

  it "can get one item by its id" do
    DatabaseCleaner.clean
    create_list(:merchant, 1)
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success

    expect(item).to have_key "name"
    expect(item).to have_key "description"
    expect(item).to have_key "unit_price"
    expect(item).to have_key "merchant_id"

    expect(item["name"]).to eq("MoonBoot13")
    expect(item["description"]).to eq("Worn by Napoleon Dynamite13")
    expect(item["unit_price"]).to eq(1)
    expect(item["unit_price"]).to_not eq(2)
    expect(item["merchant_id"]).to eq(65)
    expect(item["merchant_id"]).to_not eq(4)
  end
end
