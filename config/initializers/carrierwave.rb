# frozen_string_literal: true

CarrierWave.configure do |config|
  if Rails.env == 'production'
    require 'carrierwave/storage/abstract'
    require 'carrierwave/storage/file'
    require 'carrierwave/storage/fog'
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      use_iam_profile: true,
      region: 'ap-northeast-1',
      path_style: true
    }
    config.fog_public     = true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
    config.fog_directory = 'our-trip-puroduction'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/our-trip-puroduction'
  end
end
