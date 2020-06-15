require 'rails_helper'

RSpec.describe Plan, type: :model do
  let(:user_test) { create(:user) }
  it "titleが空の時、エラーが発生する" do
    plan = build(:plan , name: "", user_id: user_test.id)
    expect(plan).not_to be_valid
  end
  it "updated_atの降順処理が行えているか" do
    item1 = create(:plan , updated_at: Time.current + 1.days, user_id: user_test.id)
    item2 = create(:plan , updated_at: Time.current + 4.days, user_id: user_test.id)
    item3 = create(:plan , updated_at: Time.current + 3.days, user_id: user_test.id)
    item4 = create(:plan , updated_at: Time.current + 2.days, user_id: user_test.id)
    expect(Plan.all.order_by_updated_before.map(&:id)).to eq [item2.id,item3.id,item4.id,item1.id]
  end
end
