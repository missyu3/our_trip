class Notification < ApplicationRecord
  belongs_to :event, polymorphic: true

  belongs_to :notify, class_name: 'User', foreign_key: 'notify_id'
  belongs_to :notified, class_name: 'User', foreign_key: 'notified_id'

  enum action: { create_item: 0, edit_item: 1 }

  def self.build_notifications(parent_model, plan_id, current_user, action)
    participants = Participant.where_participants_other_than_yourself(plan_id,current_user)
    data_list = []
    participants.each do |participant|
      data_list.push({notify: participant.user, notified: current_user, action: action})
    end
    parent_model.notifications.build(data_list)
  end

end
