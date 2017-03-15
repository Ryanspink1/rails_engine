require 'rails_helper'

describe "item was sold the most on" do
  it "this day" do
    create(:item, id:1)
    create(:item, id:2)
    create(:invoice_item, item_id:2, created_at: "2012-03-27T14:54:05.000Z")
    create(:invoice_item, item_id:2, created_at: "2012-03-27T14:54:05.000Z")
    create(:invoice_item, item_id:2, created_at: "2012-03-27T14:54:05.000Z")
    create(:invoice_item, item_id:2, created_at: "2012-04-27T14:54:05.000Z")
    create(:invoice_item, item_id:2, created_at: "2012-04-27T14:54:05.000Z")
    # byebug
    get '/api/v1/items/2/best_day'

    expect(response).to be_success

    best_day = JSON.parse(response.body)[0]

    expect(best_day.count).to eq(1)
    expect(best_day[:created_at]).to eq("2012-03-27T14:54:05.000Z")
    expect(best_day[:created_at]).to_not eq("2012-04-27T14:54:05.000Z")

  end
end
