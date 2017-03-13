require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  context "relationships" do
    it { should have_many(:invoices) }
  end
end
