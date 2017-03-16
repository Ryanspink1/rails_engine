require 'rails_helper'

describe "find uri" do
  it "returns single item" do
    create(:merchant)
    create(:item)

    get '/api/v1/items/find?id=1'

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item).to have_key "name"
    expect(item).to have_key "description"
    expect(item).to have_key "unit_price"
    expect(item).to have_key "merchant_id"

    expect(item["name"]).to eq("Moon Boot")
    expect(item["description"]).to eq("Worn by Napoleon Dynamite")
    expect(item["unit_price"]).to eq(1)
    expect(item["unit_price"]).to_not eq(2)
    expect(item["merchant_id"]).to eq(2)
    expect(item["merchant_id"]).to_not eq(4)
  end
end
