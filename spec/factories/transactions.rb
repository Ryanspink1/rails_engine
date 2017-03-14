FactoryGirl.define do
  factory :transaction do
    sequence :credit_card_number do |n|
      12345 + n
    end
    result "Success"
    invoice 
  end
end
