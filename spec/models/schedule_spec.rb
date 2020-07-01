# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Schedule, type: :model do
  let(:user_test) { create(:user) }
  let(:plan) { create(:plan, user_id: user_test.id) }
  let(:item1) { create(:plan_item, updated_at: Time.current + 1.days, user_id: user_test.id, plan_id: plan.id) }
  let(:item2) { create(:plan_item, updated_at: Time.current + 2.days, user_id: user_test.id, plan_id: plan.id) }
  it 'データを削除できるか' do
    schedule1 = create(:schedule, plan_id: plan.id , plan_item_id: item1.id)
    expect{ schedule1.destroy }.to change{ Schedule.count }.by(-1)
  end
end
