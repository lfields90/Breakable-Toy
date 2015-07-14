require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(10, 20) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Internet.user_name }

    factory :admin do
      admin true
    end
  end

  factory :neighborhood do
    name { Faker::Address.city }
    description { Faker::Lorem.sentence }
    state { 1 }
    city_id { 1 }
    user_id { 1 }
  end
end
