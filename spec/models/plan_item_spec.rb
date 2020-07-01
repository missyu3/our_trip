# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlanItem, type: :model do
  let(:user_test) { create(:user) }
  let(:plan) { create(:plan, user_id: user_test.id) }
  it 'titleが空の時、エラーが発生する' do
    item = build(:plan_item, title: '', user_id: user_test.id, plan_id: plan.id)
    expect(item).not_to be_valid
  end
  it 'contentが空の時、エラーが発生する' do
    item = build(:plan_item, content: '', user_id: user_test.id, plan_id: plan.id)
    expect(item).not_to be_valid
  end
  it '関連付けされているscheduleのデータが削除されるか' do
    plan_item1 = create(:plan_item, plan_id: plan.id , user_id: user_test.id)
    schedule1 = create(:schedule, plan_id: plan.id , plan_item_id: plan_item1.id)
    expect{ plan_item1.destroy }.to change{ Schedule.count }.by(-1)
  end
  it 'updated_atの降順処理が行えているか' do
    item1 = create(:plan_item, updated_at: Time.current + 1.days, user_id: user_test.id, plan_id: plan.id)
    item2 = create(:plan_item, updated_at: Time.current + 4.days, user_id: user_test.id, plan_id: plan.id)
    item3 = create(:plan_item, updated_at: Time.current + 3.days, user_id: user_test.id, plan_id: plan.id)
    item4 = create(:plan_item, updated_at: Time.current + 2.days, user_id: user_test.id, plan_id: plan.id)
    expect(PlanItem.all.order_by_updated_before.map(&:id)).to eq [item2.id, item3.id, item4.id, item1.id]
  end
  it 'scheduleに登録されているデータ以外を取得できるか' do
    item1 = create(:plan_item, updated_at: Time.current + 1.days, user_id: user_test.id, plan_id: plan.id)
    item2 = create(:plan_item, updated_at: Time.current + 4.days, user_id: user_test.id, plan_id: plan.id)
    item3 = create(:plan_item, updated_at: Time.current + 3.days, user_id: user_test.id, plan_id: plan.id)
    item4 = create(:plan_item, updated_at: Time.current + 2.days, user_id: user_test.id, plan_id: plan.id)
    schedule1 = create(:schedule, plan_id: plan.id , plan_item_id: item1.id)
    schedule2 = create(:schedule, plan_id: plan.id , plan_item_id: item4.id)
    expect(PlanItem.all.where_not_include_schedule(plan.schedule).map(&:id)).to eq [item2.id, item3.id]
  end
end
