class SchedulesController < ApplicationController
  def create

  end

  def index
    @plan = Plan.find(params[:plan_id])
    @schedule = @plan.schedule
  end
end
