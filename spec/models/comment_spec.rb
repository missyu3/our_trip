require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user_test) { create(:user) }
  let(:plan) { create(:plan, user_id: user_test.id) }
  let(:item1) { create(:plan_item, updated_at: Time.current + 1.days, user_id: user_test.id, plan_id: plan.id) }
  it 'plan_itemを削除した時、データが削除されるか' do
    comment = create(:comment, plan_item_id: item1.id , user_id: user_test.id)
    expect{ item1.destroy }.to change{ Comment.count }.by(-1)
  end
  it 'titleが空の時、エラーが発生する' do
    comment = build(:comment, plan_item_id: item1.id , user_id: user_test.id , content: "")
    expect(comment).not_to be_valid
  end
end
