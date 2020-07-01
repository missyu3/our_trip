# frozen_string_literal: true

class PlanItemsController < ApplicationController
  before_action :find_params, only: %i[edit update show destroy]
  before_action :find_plan
  before_action :participant_required, only: %i[new edit]

  def new
    @plan_item = PlanItem.new
  end

  def create
    @plan_item = current_user.plan_items.new(plan_item_params)
    if @plan_item.save
      redirect_to plan_plan_items_path(lan_id: @plan_item.plan_id)
    else
      render template: 'plan_items/new', id: @plan_item.plan_id
    end
  end

  def edit; end

  def update
    if @plan_item.update(plan_item_params)
      redirect_to plan_plan_items_path(plan_id: @plan_item.plan_id)
    else
      render :edit
    end
  end

  def show; end

  def index
    @plan_item = @plan.plan_items.order_by_updated_before
  end

  def destroy
    @plan_item.destroy
    redirect_to plan_plan_items_path(plan_id: @plan_item.plan_id)
  end

  private

  def find_params
    @plan_item = PlanItem.find(params[:id])
  end

  def find_plan
    @plan = Plan.find(params[:plan_id])
  end

  def participant_required
    unless @plan.user == current_user || @plan.participants.pluck(:id).include?(current_user.id)
      redirect_to plan_plan_items_path(plan_id: @plan.id)
    end
  end

  def plan_item_params
    params.require(:plan_item).permit(:plan_id, :title, :category, :content)
  end
end
