# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'plan', type: :system do
  let(:user_test) { create(:user) }
  before do
    visit new_user_session_path
    fill_in 'Eメール', with: user_test.email
    fill_in 'パスワード', with: user_test.password
    click_button 'ログイン'
  end
  describe 'plan' do
    context '作成' do
      before do
        visit new_plan_path
        fill_in '旅行名', with: '北海道'
        fill_in '概要', with: '美味しい魚介、海胆、いくら'
        click_button '登録する'
      end
      it '作成が成功すること' do
        expect(page).to have_content '北海道'
        expect(page).to have_content '美味しい魚介、海胆、いくら'
      end
    end
    context '更新' do
      before do
        plan = create(:plan, user_id: user_test.id)
        visit edit_plan_path(plan.id)
        fill_in '旅行名', with: '北海道-函館'
        fill_in '概要', with: '美味しい魚介、海胆、いくら、ラーメン！'
        click_button '更新する'
      end
      it '更新が成功すること' do
        expect(page).to have_content '北海道-函館'
        expect(page).to have_content '美味しい魚介、海胆、いくら、ラーメン！'
      end
    end
    context '削除' do
      let(:plan1) { create(:plan, name: '北海道', user_id: user_test.id) }
      let(:plan2) { create(:plan, name: '石川', user_id: user_test.id) }
      let(:plan3) { create(:plan, name: '沖縄', user_id: user_test.id) }
      before do
        plan1
        plan2
        plan3
        visit plan_path(plan1.id)
      end
      it '削除が成功すること' do
        find('.destroy_plan').click
        expect(page).to_not have_content '北海道'
        expect(page).to have_content '沖縄'
      end
    end
    context '旅行計画所有者のみに表示されるボタン' do
      let(:user1) { create(:user, name: 'test_user1',) }
      let(:plan1) { create(:plan, name: '北海道', user_id: user1.id) }
      before do
        visit plan_path(plan1.id)
      end
      it 'planの作成者以外が旅行計画詳細画面に遷移した時、編集ボタンが表示されていないか' do
        expect(page).to_not have_content '編集'
      end
      it 'planの作成者以外が旅行計画詳細画面に遷移した時、削除ボタンが表示されていないか' do
        expect(page).to_not have_content '削除'
      end
      it 'planの作成者以外が旅行計画詳細画面に遷移した時、メンバー追加ボタンが表示されていないか' do
        expect(page).to_not have_content 'メンバー追加'
      end
      it 'planの作成者以外が旅行計画詳細画面に遷移した時、スケジュール作成ボタンが表示されていないか' do
        expect(page).to_not have_content 'スケジュール作成'
      end
    end
    context 'スケジュールが表示されているか' do
      let(:plan1) { create(:plan, name: '北海道', user_id: user_test.id) }
      before do
        item1 = create(:plan_item, user_id: user_test.id, plan_id: plan1.id) 
        item2 = create(:plan_item, user_id: user_test.id, plan_id: plan1.id, title: '沖縄', content: '豚足') 
        item3 = create(:plan_item, user_id: user_test.id, plan_id: plan1.id, title: '金沢', content: '海鮮') 
        create(:schedule, plan_id: plan1.id, plan_item_id: item1.id) 
        create(:schedule, plan_id: plan1.id, plan_item_id: item3.id) 
        create(:schedule, plan_id: plan1.id, plan_item_id: item2.id) 
        visit plan_path(plan1.id)
      end
      it 'スケジュールが表示されていること' do
        expect(page).to have_content '北海道'
        expect(page).to have_content '沖縄'
        expect(page).to have_content '金沢'
      end
    end
    context '編集ボタンを押下した時、旅行項目の編集画面に遷移しているか' do
      let(:plan1) { create(:plan, name: '北海道', user_id: user_test.id) }
      before do
        visit plan_path(plan1.id)
      end
      it '編集画面へ遷移していること' do
        click_on '編集'
        expect(current_path).to eq edit_plan_path(plan1.id)
      end
    end
    context 'メンバー追加ボタンを押下した時、メンバー追加画面に遷移しているか' do
      let(:plan1) { create(:plan, name: '北海道', user_id: user_test.id) }
      before do
        visit plan_path(plan1.id)
      end
      it 'メンバー追加画面に遷移していること' do
        click_on 'メンバー追加'
        expect(current_path).to eq plan_participants_path(plan_id: plan1.id)
      end
      it 'メンバー追加画面に管理者の名前が表示されているか' do
        click_on 'メンバー追加'
        expect(page).to have_content user_test.name
      end
    end
    context 'スケジュール作成ボタンを押下した時、スケジュール作成画面に遷移しているか' do
      let(:plan1) { create(:plan, name: '北海道', user_id: user_test.id) }
      before do
        visit plan_path(plan1.id)
      end
      it 'スケジュール作成画面に遷移していること' do
        click_on 'スケジュール作成'
        expect(current_path).to eq plan_schedules_path(plan_id: plan1.id)
      end
    end
  end
end
