require 'rails_helper'

describe "item was sold the most on" do
  it "this day" do
    create(:item, id:1)
    create(:invoice, id:1, created_at: "2012-03-27T14:54:05.000Z")
    create(:invoice_item, quantity:4, item_id:1, invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z")
    create(:transaction, invoice_id: 1)
    create(:invoice, id:2, created_at: "2012-04-27T14:54:05.000Z")
    create(:invoice_item, quantity:3, item_id:1, invoice_id: 2, created_at: "2012-04-27T14:54:05.000Z")
    create(:transaction, invoice_id: 2)

    get '/api/v1/items/1/best_day'

    expect(response).to be_success

    best_day = JSON.parse(response.body)

    expect(best_day["best_day"]).to eq("2012-03-27T14:54:05.000Z")
    expect(best_day["best_day"]).to_not eq("2012-04-27T14:54:05.000Z")

  end
end
