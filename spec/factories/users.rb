FactoryBot.define do
  factory :user do
    name { "user1" }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { "testuser" }
  end
end
