# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @participants = Participant.where(user_id: current_user.id).includes(plan: :user).page(params[:page]).per(KAMINARI_PER)
  end
end
