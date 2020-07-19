# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @plans = Plan.where(user_id: @user.id).includes(:user).page(params[:page]).per(KAMINARI_PER)
  end
end
