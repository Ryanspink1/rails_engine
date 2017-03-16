require 'rails_helper'

describe "find uri" do
  it "returns single invoice item" do
    create(:invoice_item, id:1)

    get '/api/v1/invoice_items/find?id=1'

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(invoice_item).to have_key "item_id"
    expect(invoice_item).to have_key "invoice_id"

  end
end
