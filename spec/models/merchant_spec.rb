require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "relationships" do
    it { should have_many(:items) }
    it { should have_many(:invoices) }
  end
  
end
