FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name(8) }
    password { Faker::Internet.password}
  end
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    author { Faker::Internet.user_name(8) }
  end
  factory :comment do
    name { Faker::Name.name }
    body { Faker::Lorem.paragraph}
    post_id { 1 }
  end
  factory :calendar do
    summary { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    time { Faker::Time.forward(23, :morning) }
    readable_time { Faker::Date.forward(23) }
  end
  factory :video do
    link { "//www.youtube.com/embed/_yOlihvcdLA" }
  end
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    message { Faker::Lorem.paragraph }
  end
end