class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :plan_item
  has_many :notifications, as: :event
  
  validates :content, presence: true

  scope :plan_item_relation, -> (plan_item_id)  { where(plan_item_id: plan_item_id) }
  scope :order_by_id_desc, -> { order(id: "DESC") }

  def self.get_comments_for_plan_item(plan_item_id)
    self.plan_item_relation(plan_item_id).includes(:user).order_by_id_desc
  end
end
