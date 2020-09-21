# frozen_string_literal: true

class SchedulesController < ApplicationController
  protect_from_forgery
  before_action :find_plan

  def index
    @schedule = @plan.schedules.includes(plan_item: :user).order(position: "ASC")
    @plan_item = @plan.plan_items.where_not_include_schedule(@schedule).includes(:user)
  end

  def sort
    # fromはドラッグ前の位置、toはドラッグ後の位置
    schedule = @plan.schedule[params[:from].to_i]
    schedule.insert_at(params[:to].to_i + 1)
  end

  def add
    position = params[:to].to_i + 1
    schedule = Schedule.new(plan_id: @plan.id, plan_item_id: params[:evt_id].to_i, position: position)
    schedule.save
  end

  def remove
    schedule = @plan.schedule[params[:from].to_i]
    schedule.destroy
  end

  private

  def find_plan
    @plan = Plan.find(params[:plan_id])
  end
end
