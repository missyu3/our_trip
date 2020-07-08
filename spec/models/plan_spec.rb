# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Plan, type: :model do
  let(:user_test) { create(:user) }
  it 'titleが空の時、エラーが発生する' do
    plan = build(:plan, name: '', user_id: user_test.id)
    expect(plan).not_to be_valid
  end
  it 'updated_atの降順処理が行えているか' do
    item1 = create(:plan, updated_at: Time.current + 1.days, user_id: user_test.id)
    item2 = create(:plan, updated_at: Time.current + 4.days, user_id: user_test.id)
    item3 = create(:plan, updated_at: Time.current + 3.days, user_id: user_test.id)
    item4 = create(:plan, updated_at: Time.current + 2.days, user_id: user_test.id)
    expect(Plan.all.order_by_updated_before.map(&:id)).to eq [item2.id, item3.id, item4.id, item1.id]
  end
  it '関連付けされているplan_itemのデータが削除されるか' do
    item1 = create(:plan, updated_at: Time.current + 1.days, user_id: user_test.id)
    plan_item1 = create(:plan_item, plan_id: item1.id , user_id: user_test.id)
    expect{ item1.destroy }.to change{ PlanItem.count }.by(-1)
  end
  it '関連付けされているparticipantsのデータが削除されるか' do
    item1 = create(:plan, updated_at: Time.current + 1.days, user_id: user_test.id)
    participant1 = create(:participant, user_id: user_test.id ,plan_id: item1.id )
    expect{ item1.destroy }.to change{ Participant.count }.by(-1)
  end
  it '関連付けされているscheduleのデータが削除されるか' do
    item1 = create(:plan, updated_at: Time.current + 1.days, user_id: user_test.id)
    plan_item1 = create(:plan_item, plan_id: item1.id , user_id: user_test.id)
    schedule1 = create(:schedule, plan_id: item1.id , plan_item_id: plan_item1.id)
    expect{ item1.destroy }.to change{ Schedule.count }.by(-1)
  end
end
