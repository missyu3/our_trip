class Schedule < ApplicationRecord
  belongs_to :plan
  belongs_to :plan_item

  scope :order_by_sort_asc, -> { order(sort: :asc) }

end
