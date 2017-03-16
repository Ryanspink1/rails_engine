require 'rails_helper'

  describe "/api/v1/items/most_revenue?quantity=x" do
    it "returns the top x items ranked by total revenue generated" do

      create(:item, id:1)
      create(:item, id:2)
      create(:item, id:3)
      create(:item, id:4)
      create(:invoice_item, id: 1, item_id: 1, quantity: 10, unit_price: 10)
      create(:invoice_item, id: 2, item_id: 2, quantity: 9, unit_price: 9)
      create(:invoice_item, id: 3, item_id: 3, quantity: 8, unit_price: 8)
      create(:invoice_item, id: 4, item_id: 4, quantity: 7, unit_price: 7)

      get '/api/v1/items/most_revenue?quantity=3'

      expect(response).to be_success

      items = JSON.parse(response.body)

      expect(items.count).to eq(3)

      expect(items.first["id"]).to eq(1)
      expect(items.first["id"]).to_not eq(2)
      expect(items.second["id"]).to eq(2)
      expect(items.second["id"]).to_not eq(3)
      expect(items.third["id"]).to eq(3)
      expect(items.third["id"]).to_not eq(1)
    end

    it "returns the top item ranked by total revenue generated" do
      create(:item, id:1)
      create(:item, id:2)
      create(:item, id:3)
      create(:item, id:4)
      create(:invoice_item, id: 1, item_id: 1, quantity: 10, unit_price: 10)
      create(:invoice_item, id: 2, item_id: 2, quantity: 9, unit_price: 9)
      create(:invoice_item, id: 3, item_id: 3, quantity: 8, unit_price: 8)
      create(:invoice_item, id: 4, item_id: 4, quantity: 7, unit_price: 7)

      get '/api/v1/items/most_revenue?quantity=1'

      expect(response).to be_success

      item = JSON.parse(response.body)

      expect(item.count).to eq(1)

      expect(item.first["id"]).to eq(1)
      expect(item.first["id"]).to_not eq(4)
    end

  end
