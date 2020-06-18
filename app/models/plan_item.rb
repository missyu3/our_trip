class PlanItem < ApplicationRecord
  belongs_to :plan
  belongs_to :user
  has_one :schedule

  enum categories: { nothing: 0, move: 1, activity: 2, meal: 3, lodging: 4 }

  validates :title   , presence: true
  validates :content , presence: true

  scope :order_by_updated_before, -> { order(updated_at: :desc) }
  scope :where_not_include_schedule, -> (schedule){ where.not(id: schedule.to_a.map { |item| item[:plan_item_id] }) }

end