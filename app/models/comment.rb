class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :plan_item
  
  validates :content, presence: true

  scope :plan_item_relation, -> (plan_item_id)  { where(plan_item_id: plan_item_id) }
  scope :order_by_id_desc, -> { order(id: "DESC") }

  def self.get_comments_by_kaminari(plan_item_id,params_page)
    self.plan_item_relation(plan_item_id).includes(:user).order_by_id_desc.page(params_page).per(10)
  end
end
