FactoryBot.define do
  factory :notification do
    notify_id { 1 }
    notified_id { 2 }
    action { 0 }
    checked { false }
  end
end
