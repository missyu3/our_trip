require 'rails_helper'

RSpec.describe "plan", type: :system do
  let(:user_test) { create(:user) }
  before do
    visit new_user_session_path
    fill_in "Eメール", with: user_test.email
    fill_in "パスワード", with:user_test.password
    click_button 'ログイン'
  end
  describe 'plan' do
    context '作成' do
      before do
        visit new_plan_path
        fill_in "旅行名", with: "北海道"
        fill_in "概要", with: "美味しい魚介、海胆、いくら"
        click_button '登録する'
      end
      it '作成が成功すること' do
        expect(page).to have_content "北海道"
        expect(page).to have_content "美味しい魚介、海胆、いくら"
      end
    end
    context '更新' do
      before do
        plan = create(:plan, user_id: user_test.id)
        visit edit_plan_path(plan.id)
        fill_in "旅行名", with: "北海道-函館"
        fill_in "概要", with: "美味しい魚介、海胆、いくら、ラーメン！"
        click_button '更新する'
      end
      it '更新が成功すること' do
        expect(page).to have_content "北海道-函館"
        expect(page).to have_content "美味しい魚介、海胆、いくら、ラーメン！"
      end
    end
    context '削除' do
      let(:plan1) { create(:plan, name: "北海道" , user_id: user_test.id) }
      let(:plan2) { create(:plan, name: "石川" , user_id: user_test.id) }
      let(:plan3) { create(:plan, name: "沖縄" , user_id: user_test.id) }
      before do
        plan1
        plan2
        plan3
        visit plan_path(plan1.id)
      end
      it '削除が成功すること' do
        find(".destroy_plan").click
        expect(page).to_not have_content "北海道"
        expect(page).to have_content "沖縄"
      end
    end
  end
end