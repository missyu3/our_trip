class Plan < ApplicationRecord
  belongs_to :user
  has_many :plan_items, dependent: :destroy
  has_many :schedule, dependent: :destroy

  validates :name, presence: true

  scope :order_by_updated_before, -> { order(updated_at: :desc) }
end
