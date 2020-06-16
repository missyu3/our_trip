require 'rails_helper'

RSpec.describe PlanItem, type: :model do
  let(:user_test) { create(:user) }
  let(:plan) { create(:plan , user_id: user_test.id) }
  it "titleが空の時、エラーが発生する" do
    item = build(:plan_item , title: "", user_id: user_test.id , plan_id: plan.id)
    expect(item).not_to be_valid
  end
  it "contentが空の時、エラーが発生する" do
    item = build(:plan_item , content: "", user_id: user_test.id , plan_id: plan.id)
    expect(item).not_to be_valid
  end
  it "updated_atの降順処理が行えているか" do
    item1 = create(:plan_item , updated_at: Time.current + 1.days, user_id: user_test.id , plan_id: plan.id)
    item2 = create(:plan_item , updated_at: Time.current + 4.days, user_id: user_test.id , plan_id: plan.id)
    item3 = create(:plan_item , updated_at: Time.current + 3.days, user_id: user_test.id , plan_id: plan.id)
    item4 = create(:plan_item , updated_at: Time.current + 2.days, user_id: user_test.id , plan_id: plan.id)
    expect(PlanItem.all.order_by_updated_before.map(&:id)).to eq [item2.id,item3.id,item4.id,item1.id]
  end

end
