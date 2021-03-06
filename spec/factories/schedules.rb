# frozen_string_literal: true

FactoryBot.define do
  factory :schedule do
    plan_id { 1 }
    position { 1 }
    plan_item_id { 1 }
    start_datetime { 2020 / 1 / 1 }
  end
end
