# frozen_string_literal: true

class PlanItem < ApplicationRecord
  belongs_to :plan
  belongs_to :user
  has_one :schedule, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum category: { move: 1, activity: 2, meal: 3, lodging: 4 }

  validates :title, presence: true
  validates :category, presence: true
  validates :content, presence: true
  validates :budget, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  scope :order_by_updated_before, -> { order(updated_at: :desc) }
  scope :where_not_include_schedule, ->(schedule) { where.not(id: schedule.to_a.map { |item| item[:plan_item_id] }) }
end
