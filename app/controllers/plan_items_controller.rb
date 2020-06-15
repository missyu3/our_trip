class PlanItemsController < ApplicationController
  before_action :find_params, only: [:edit, :update, :show, :destroy]

#ネストさせる。そしたらParamsIDが取れるので、

  def new
    @plan_item = PlanItem.new
    @plan = Plan.find(params[:plan_id]) 
  end

  def create
    @plan_item = current_user.plan_items.new(plan_item_params)
    if @plan_item.save
      redirect_to plan_plan_item_path(id: @plan_item.id)
    else
      render :new
    end
  end

  def edit
    @plan = Plan.find(@plan_item.plan_id) 
  end

  def update
    if @plan_item.update(plan_params)
      redirect_to plan_item_path(@plan_item)
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @plan_item.destroy
    redirect_to plan_path(@plan_item.plan_id)
  end

  private

  def find_params
    @plan_item = PlanItem.find(params[:id])
  end

  def plan_item_params
    params.require(:plan_item).permit(:plan_id, :title, :category, :content)
  end
end