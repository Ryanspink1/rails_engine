require 'rails_helper'

describe "merchant revenue endpoint" do
  it "returns total revenue for specific merchant" do
    id = create(:merchant).id
    

    get "/api/v1/merchants/:id/revenue"

    revenue = JSON.parse(response.body)

    expect(response).to be_success

  end
end
