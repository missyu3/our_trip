require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:user_test1) { create(:user) }
  let(:user_test2) { create(:user, name: "test2") }
  let(:plan) { create(:plan, user_id: user_test1.id) }
  let(:item) { create(:plan_item, updated_at: Time.current + 1.days, user_id: user_test1.id, plan_id: plan.id) }
  it 'plan_itemを削除した時、データが削除されるか' do
    notification = create(:notification, notify: user_test1 , notified: user_test2, event: item)
    expect{ item.destroy }.to change{ Notification.count }.by(-1)
  end
  it 'ポリモーフィック関連付けがされているモデルに必要なメソッドが定義されているか' do
    constants = Object.constants.map do |name|
      name.to_s.constantize
    end
    models = constants.select do |c|
      next unless c.class == Class && c < ActiveRecord::Base && !c.abstract_class?
      c.reflect_on_all_associations.map(&:name).include?(:notifications)
    end
    
    models.each do |model|
      expect(model.method_defined?(:notification_params_hash)).to be true
      expect(model.method_defined?(:notification_create_message)).to be true
      expect(model.method_defined?(:notification_update_message)).to be true
    end
  end
  it 'Planの参加者全員に対して通知を行っているか' do
    user_test3 = create(:user, name: "test3")
    create(:participant, plan_id: plan.id,user_id: user_test1.id)
    create(:participant, plan_id: plan.id,user_id: user_test2.id)
    create(:participant, plan_id: plan.id,user_id: user_test3.id)

    item.notifications.build_notifications(item, item.plan_id, user_test1, 0)
    expect{ item.save }.to change{ Notification.count }.by(2)
  end
end
