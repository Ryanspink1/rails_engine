FactoryGirl.define do
  factory :item do
    name "Moon Boot"
    description "Worn by Napoleon Dynamite"
    unit_price 1
    created_at "2012-03-27 14:53:59"
    updated_at "2012-03-27 14:53:59"
    sequence :merchant_id do |n|
      n
    end
  end
end
