require 'rails_helper'

describe 'merchant id items endpoints' do
  it 'shows list of items belonging to single merchant' do

    create(:merchant, id: 1)
    create(:item, name: "moonboots", merchant_id: 1)
    create(:item, name: "abalone", merchant_id: 1)
    create(:item, name: "dog", merchant_id: 1)
    create(:item, name: "dvd", merchant_id: 1)

    get '/api/v1/merchants/1/items'

    items = JSON.parse(response.body)

    expect(items.count).to eq(4)

    items.each do |item|
      expect(item["merchant_id"]).to eq(1)
    end
  end
end
