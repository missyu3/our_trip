class ParticipantsController < ApplicationController
  def index
    @participant = Participant.new
    @plan = Plan.find(params[:plan_id]) 
    @participants = @plan.participants
  end

  def create
    params = participant_params
    flash[:notice] = Participant.check_and_create(params[:plan_id] , params[:name])
    redirect_to plan_participants_path(params[:plan_id])
  end
  
  def destroy
    plan = Plan.find_by(id: params[:plan_id])
    participant = Participant.find_by(id: params[:id])
    if participant.destroy
      flash[:notice] = 'ユーザーを削除しました。'
    else
      flash[:alert] = 'ユーザーの削除に失敗しました。'
    end
    redirect_to plan_participants_path(plan)
  end

  private
  def participant_params
    params.require(:participant).permit(:plan_id, :name)
  end
end
