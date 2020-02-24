FactoryBot.define do
  factory :transaction do
    status { 1 }
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    customer_email { Faker::Internet.email }
    customer_phone { Faker::PhoneNumber.cell_phone }
    association :merchant, factory: :user
  end
end
