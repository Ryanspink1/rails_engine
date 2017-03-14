FactoryGirl.define do
  factory :invoice do
    # sequence :customer_id do |n|
    #   n
    # end
    #
    # sequence :merchant_id do |n|
    #   n
    # end
    merchant
    customer 
    status "shipped"
  end
end
