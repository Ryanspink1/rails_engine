FactoryGirl.define do
  factory :transaction do
    invoice nil
    credit_card_number "MyString"
    result "MyString"
    transaction_created
    transaction_updated
  end
end
