FactoryBot.define do
  factory :user do
    status { 1 }
    email { Faker::Internet.email }
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    password { '123456' }
  end
end
