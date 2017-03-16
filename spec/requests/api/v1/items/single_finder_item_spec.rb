require 'rails_helper'

describe "find uri" do
  it "returns single item" do
    create(:merchant, id:2)
    create(:item, id:1, merchant_id: 2)

    get '/api/v1/items/find?id=1'

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item).to have_key "name"
    expect(item).to have_key "description"
    expect(item).to have_key "unit_price"
    expect(item).to have_key "merchant_id"

    expect(item["name"]).to eq("MoonBoot")
    expect(item["description"]).to eq("Worn by Napoleon Dynamite")
    expect(item["unit_price"]).to eq("0.01")
    expect(item["unit_price"]).to_not eq(2)
    expect(item["merchant_id"]).to eq(2)
    expect(item["merchant_id"]).to_not eq(4)
  end
end
