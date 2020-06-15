class PlanItem < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  enum categories: { nothing: 0, move: 1, activity: 2, meal: 3, lodging: 4 }

  scope :order_by_updated_before, -> { order(updated_at: :desc) }

end