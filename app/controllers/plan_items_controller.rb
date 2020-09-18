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
      redirect_to plan_plan_items_path(plan_id: @plan_item.plan_id)
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

  def show
    @comment = Comment.new
    @comments = Comment.get_comments_for_plan_item(@plan_item.id).page(params[:page]).per(KAMINARI_PER)
  end

  def index
    @plan_item = @plan.plan_items.includes(:user).order_by_updated_before.page(params[:page]).per(KAMINARI_PER)
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
    unless @plan.user == current_user || @plan.participants.pluck(:user_id).include?(current_user.id)
      redirect_to plan_plan_items_path(plan_id: @plan.id)
    end
  end

  def plan_item_params
    params.require(:plan_item).permit(:plan_id, :title, :category , :budget , :content, :address)
  end
end
