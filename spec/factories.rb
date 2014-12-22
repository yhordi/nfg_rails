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
  factory :calendar do
    summary { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    time { Faker::Time.forward(23, :morning) }
    readable_time { Faker::Date.forward(23) }
  end
end