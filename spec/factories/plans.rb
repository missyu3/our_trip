FactoryBot.define do
  factory :plan do
    name { "北海道" }
    content { "海産物が美味しいよ！" }
    user_id { 1 }
  end
end
