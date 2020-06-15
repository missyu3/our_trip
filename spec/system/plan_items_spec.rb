require 'rails_helper'

RSpec.describe "plan_item", type: :system do
  let(:user_test) { create(:user) }
  let(:plan) { create(:plan , user_id: user_test.id) }
  let(:plan_item) { create(:plan_item , user_id: user_test.id , plan_id: plan.id) }
  let(:plan_item2) { create(:plan_item , user_id: user_test.id , plan_id: plan.id , title: "沖縄" , content: "豚足") }
  before do
    visit new_user_session_path
    fill_in "メールアドレス", with: user_test.email
    fill_in "パスワード", with:user_test.password
    click_button 'Log in'
  end
  describe 'plan_item' do
    context '作成' do
      before do
        visit new_plan_plan_item_path(plan.id)
        fill_in "タイトル", with: "札幌"
        select "食事", from: "カテゴリー"
        fill_in "概要", with: "味噌ラーメン"
        click_button '登録する'
      end
      it '作成が成功すること' do
        expect(page).to have_content "札幌"
        expect(page).to have_content "味噌ラーメン"
      end
    end
    context '更新' do
      before do
        plan
        plan_item
        visit plan_path(plan.id)
        find(".edit_plan_item#{plan_item.id}").click 
        fill_in "タイトル", with: "東京"
        select "移動", from: "カテゴリー"
        fill_in "概要", with: "東京メトロ"
        click_button '更新する'
      end
      it '作成が成功すること' do
        expect(page).to have_content "東京"
        expect(page).to have_content "東京メトロ"
      end
    end
    context '削除' do
      before do
        plan
        plan_item
        plan_item2
        visit plan_path(plan.id)
        find(".destroy_plan_item#{plan_item.id}").click 
      end
      it '作成が成功すること' do
        expect(page).to_not have_content "札幌"
        expect(page).to_not have_content "味噌ラーメン"
        expect(page).to have_content "沖縄"
        expect(page).to have_content "豚足"
      end
    end
  end
end