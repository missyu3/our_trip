
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'notification', type: :system do
  let(:user_test1) { create(:user) }
  let(:user_test2) { create(:user, name: "test2") }
  let(:user_test3) { create(:user, name: "test3") }
  let(:plan) { create(:plan, user_id: user_test1.id) }
  let(:plan_item) { create(:plan_item, user_id: user_test1.id, plan_id: plan.id) }
  before do
    visit new_user_session_path
    fill_in 'Eメール', with: user_test1.email
    fill_in 'パスワード', with: user_test1.password
    click_button 'ログイン'
  end
  describe 'notification' do
    context '通知が表示されているか' do
      before do
        create(:participant, plan_id: plan.id,user_id: user_test1.id)
        create(:participant, plan_id: plan.id,user_id: user_test2.id)
        create(:participant, plan_id: plan.id,user_id: user_test3.id)
        plan_item.notifications.build_notifications(plan_item, plan_item.plan_id, user_test3, 0)
        plan_item.save
        click_on '通知'
      end
      it '表示されていること' do
        expect(page).to have_content '計画の詳細情報が作成されました。'
      end
    end
  end
end