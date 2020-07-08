# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'user1' }
    sequence(:email) { |n| "TEST#{n}@example.com" }
    password { 'testuser' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'factories', 'test.jpg')) }
  end
end
