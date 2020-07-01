class Participant < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  attr_accessor :name

  def self.check_and_create(plan_id , user_name)
    user = User.find_by(name: user_name)
    return '存在しないユーザーです' if user.blank?

    participant = Participant.find_by(plan_id: plan_id , user_id: user.id)
    return 'そのユーザーはすでに参加済みです' if participant.present?
    
    participant = Participant.new(plan_id: plan_id , user_id: user.id)
    if participant.save
      'ユーザーを追加しました。'
    else
      'ユーザーの追加に失敗しました。'
    end
  end
end
