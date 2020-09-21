# frozen_string_literal: true

class Plan < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :schedules, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :plan_items, dependent: :destroy

  validates :name, presence: true

  scope :order_by_updated_before, -> { order(updated_at: :desc) }

  attr_reader :geocoder_map_center_lat
  attr_reader :geocoder_map_center_lng

  def set_geocoder_center_point
    addresses = []
    self.schedules.each do |place|
      next if place.plan_item.address.blank?
      addresses.push(place.plan_item)
    end
    if addresses.any?
      center = Geocoder::Calculations.geographic_center(addresses)
      @geocoder_map_center_lat = center[0]
      @geocoder_map_center_lng = center[1]
    end
  end
end
