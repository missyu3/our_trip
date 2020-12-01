# frozen_string_literal: true

class PlanItem < ApplicationRecord
  belongs_to :plan
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :event
  has_one :schedule, dependent: :destroy

  enum category: { move: 1, activity: 2, meal: 3, lodging: 4 }

  validates :title, presence: true
  validates :category, presence: true
  validates :content, presence: true
  validates :budget, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  scope :order_by_updated_before, -> { order(updated_at: :desc) }
  scope :where_not_include_schedule, ->(schedule) { where.not(id: schedule.to_a.map { |item| item[:plan_item_id] }) }

  def notification_params_hash
    hash = {}
    hash[:plan_id] = self.plan_id
    hash[:plan_item_id] = self.id
    hash
  end

  def notification_create_message()
    "#{self.user.name}により計画の詳細情報が作成されました。"
  end

  def notification_update_message(editer_name)
    "#{editer_name}により計画の詳細情報が更新されました。"
  end
end
