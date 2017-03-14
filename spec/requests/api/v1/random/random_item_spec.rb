require 'rails_helper'

describe "item random finder" do
  it "will return a random item item instance" do
    create_list(:item, 20)
    get "/api/v1/items/random"

    item = JSON.parse(response.body)
    expect(response).to be_success
    expect(item).to have_key "id"
    expect(item).to have_key "name"
    expect(item).to have_key "description"
    expect(item).to have_key "unit_price"
    expect(item).to have_key "merchant_id"
  end
end
