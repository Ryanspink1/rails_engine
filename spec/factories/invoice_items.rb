FactoryGirl.define do
  factory :invoice_item do
    sequence :item_id do |n|
      n
    end

    sequence :invoice_id do |n|
      n
    end

    quantity 1
    unit_price 1
  end
end
