# frozen_string_literal: true

FactoryBot.define do
  factory :plan_item do
    plan_id { 1 }
    title { '函館' }
    category { 3 }
    content { 'お寿司、海胆' }
    user_id { 1 }
  end
end
