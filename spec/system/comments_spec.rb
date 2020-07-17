
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comment', type: :system do
  let(:user_test) { create(:user) }
  let(:plan) { create(:plan, user_id: user_test.id) }
  let(:plan_item) { create(:plan_item, user_id: user_test.id, plan_id: plan.id) }
  let(:plan_item2) { create(:plan_item, user_id: user_test.id, plan_id: plan.id, title: '沖縄', content: '豚足') }
  before do
    visit new_user_session_path
    fill_in 'Eメール', with: user_test.email
    fill_in 'パスワード', with: user_test.password
    click_button 'ログイン'
  end
  describe 'comment' do
    context 'コメントした文言が表示されているか' do
      before do
        visit plan_plan_item_path(plan_id: plan.id,id: plan_item.id)
        fill_in 'comment_content', with: "コメントします。"
        click_button 'コメントする'
      end
      it '表示されていること' do
        expect(page).to have_content 'コメントします。'
      end
      context '作成されたコメントが別の箇所に表示されていないか' do
        before do
          create(:comment, user_id: user_test.id, plan_item_id: plan_item2.id, content: "コメントしました")
          visit plan_plan_item_path(plan_id: plan.id,id: plan_item.id)
        end
        it '表示されていないこと' do
          expect(page).to_not have_content 'コメントしました'
        end
      end
    end
  end
end