class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :plan_item
  has_many :notifications, as: :event, dependent: :destroy
  
  validates :content, presence: true

  scope :plan_item_relation, -> (plan_item_id)  { where(plan_item_id: plan_item_id) }
  scope :order_by_id_desc, -> { order(id: "DESC") }

  def self.get_comments_for_plan_item(plan_item_id)
    self.plan_item_relation(plan_item_id).includes(:user).order_by_id_desc
  end

  def notification_params_hash
    hash = {}
    hash[:plan] = self.plan_item.plan
    hash[:plan_item] = self.plan_item
    hash
  end

  def notification_create_message()
    "#{self.user.name}によりコメントされました。"
  end

  def notification_update_message(editer_name)
    "#{editer_name}によりコメントが編集されました。"
  end
end
