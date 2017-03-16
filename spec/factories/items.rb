FactoryGirl.define do
  factory :item do
    name "MoonBoot"
    # sequence :name do |n|
    #  "MoonBoot#{n}"
    # end

    description "Worn by Napoleon Dynamite"

    unit_price 1
    created_at "2012-03-27 14:53:59"
    updated_at "2012-03-27 14:53:59"
    merchant
  end
end
