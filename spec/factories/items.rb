FactoryGirl.define do
  factory :item do
    sequence :name do |n|
     "MoonBoot#{n}"
    end

    sequence :description do |n|
     "Worn by Napoleon Dynamite#{n}"
   end

    unit_price 1
    created_at "2012-03-27 14:53:59"
    updated_at "2012-03-27 14:53:59"
    merchant
  end
end
