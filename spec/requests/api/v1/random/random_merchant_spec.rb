require 'rails_helper'

describe "merchant random finder" do
  it "will return a random merchant instance" do
    create_list(:merchant, 20)

    get "/api/v1/merchants/random"

    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant).to have_key "id"
    expect(merchant).to have_key "name"
  end
end
