require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context "validations" do
    it { should validate_presence_of(:status) }
  end

  context "relationships" do
    it {should belong_to(:customer) }
    it {should belong_to(:merchant) }
    it {should have_many(:invoice_items) }
    it {should have_many(:items) }
  end

end
