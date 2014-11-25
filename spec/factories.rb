FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name(8) }
    password 'password'
  end
end