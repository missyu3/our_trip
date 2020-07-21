# frozen_string_literal: true

class ParticipantsController < ApplicationController
  def index
    @plan = Plan.find(params[:plan_id])
    @participant = Participant.new
    @participants = Participant.where(plan_id: @plan.id).includes(:user).page(params[:page]).per(KAMINARI_PER)
  end

  def create
    params = participant_params
    flash[:notice] = Participant.check_and_create(params[:plan_id], params[:name])
    redirect_to plan_participants_path(params[:plan_id])
  end

  def destroy
    plan = Plan.find_by(id: params[:plan_id])
    participant = Participant.find_by(id: params[:id])
    if participant.user == plan.user
      flash[:notice] = '管理者は削除できません'
    else
      if participant.destroy
        flash[:notice] = 'ユーザーを削除しました。'
      else
        flash[:alert] = 'ユーザーの削除に失敗しました。'
      end
    end
    redirect_to plan_participants_path(plan)
  end

  private

  def participant_params
    params.require(:participant).permit(:plan_id, :name)
  end
end
