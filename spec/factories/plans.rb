# frozen_string_literal: true

FactoryBot.define do
  factory :plan do
    name { '北海道' }
    content { '海産物が美味しいよ！' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'factories', 'test.jpg')) }
    user_id { 1 }
  end
end
