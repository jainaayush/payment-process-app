FactoryBot.define do
  factory :transaction do
    status { 1 }
    type { '' }
    uuid { 'MyString' }
    amount { 1.5 }
    customer_email { 'MyString' }
    customer_phone { 'MyString' }
    reference_id { 1 }
    merchant_id { 1 }
  end
end
