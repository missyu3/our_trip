# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'participant', type: :system do
  let(:login_user) { create(:user, name: "user") }
  let(:user_test1) { create(:user, name: "test1") }
  let(:user_test2) { create(:user, name: "test2") }
  let(:user_test3) { create(:user, name: "test3") }
  let(:plan) { create(:plan, user_id: login_user.id) }
  before do
    visit new_user_session_path
    fill_in 'Eメール', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログイン'
    create(:participant, plan_id: plan.id,user_id: user_test1.id)
  end
  describe 'participant' do
    context '作成' do
      before do
        visit plan_participants_path(plan.id)
      end
      it '作成が成功すること' do
        fill_in 'participant_name', with: user_test2.name
        click_button '登録する'
        expect(page).to have_content user_test2.name
      end
      it 'すでに登録されているユーザーを登録しようとした時、そのユーザーはすでに参加済みですと表示されるか' do
        fill_in 'participant_name', with: user_test1.name
        click_button '登録する'
        expect(page).to have_content 'そのユーザーはすでに参加済みです'
      end
      it '存在しないユーザーを登録しようとした時、存在しないユーザーですと表示されるか' do
        fill_in 'participant_name', with: 'hogehoge'
        click_button '登録する'
        expect(page).to have_content '存在しないユーザーです'
        expect(page).to_not have_content 'hogehoge'
      end
    end
    context '削除' do
      it '登録されているユーザーを削除することができるか' do
        visit plan_participants_path(plan.id)
        click_on '削除'
        expect(page).to_not have_content user_test1.name
      end
    end
    context '表示' do
      it '登録されているユーザーが表示されているか' do
        create(:participant, plan_id: plan.id,user_id: user_test2.id)
        create(:participant, plan_id: plan.id,user_id: user_test3.id)
        visit plan_participants_path(plan.id)
        expect(page).to have_content user_test1.name
        expect(page).to have_content user_test2.name
        expect(page).to have_content user_test3.name
      end
      it '別のplanの参加者が表示されていないか' do
        user_test4 =  create(:user, name: "test4") 
        user_test5 = create(:user, name: "test5") 
        plan1 = create(:plan, user_id: user_test4.id) 
        create(:participant, plan_id: plan1.id,user_id: user_test5.id)
        visit plan_participants_path(plan.id)
        expect(page).to_not have_content user_test4.name
        expect(page).to_not have_content user_test5.name
      end
    end
  end
end
