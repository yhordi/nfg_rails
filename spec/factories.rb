  FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name(8) }
    password 'password'
  end
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    author { Faker::Internet.user_name(8) }
  end
end