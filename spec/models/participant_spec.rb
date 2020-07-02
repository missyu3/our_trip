# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Participant, type: :model do
  let(:user_test) { create(:user) }
  let(:plan) { create(:plan, user_id: user_test.id) }
  it 'データを削除できるか' do
    participant1 = create(:participant, plan_id: plan.id , user_id: user_test.id)
    expect{ participant1.destroy }.to change{ Participant.count }.by(-1)
  end
  it '登録処理が成功した時、"ユーザーを追加しました。"」と返ってくるか' do
    participant1 = Participant.check_and_create(plan.id,user_test.name)
    expect(participant1).to eq "ユーザーを追加しました。"
  end
  it '登録されてないユーザーを参加させた時、「「存在しないユーザーです」が返ってくるか' do
    participant1 = Participant.check_and_create(plan.id,"hogehoge")
    expect(participant1).to eq "存在しないユーザーです"
  end
  it 'すでに参加しているユーザーを参加させようとした時、「そのユーザーはすでに参加済みです」が返ってくるか' do
    participant1 = Participant.check_and_create(plan.id,user_test.name)
    participant2 = Participant.check_and_create(plan.id,user_test.name)
    expect(participant2).to eq "そのユーザーはすでに参加済みです"
  end

end
