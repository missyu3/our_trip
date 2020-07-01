class Plan < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :schedule, -> { order(position: :asc) } , dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :plan_items, dependent: :destroy

  validates :name, presence: true

  scope :order_by_updated_before, -> { order(updated_at: :desc) }
end
