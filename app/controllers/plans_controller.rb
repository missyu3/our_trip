# frozen_string_literal: true

class PlansController < ApplicationController
  before_action :find_params, only: %i[edit update show destroy]

  def new
    @plan = Plan.new
  end

  def create
    @plan = current_user.plans.new(plan_params)
    if @plan.save
      redirect_to plans_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @plan.update(plan_params)
      redirect_to plan_path(@plan)
    else
      render :edit
    end
  end

  def index
    @plan = Plan.all.order_by_updated_before.page(params[:page]).per(KAMINARI_PER)
  end

  def show
    @schedules = Schedule.where(plan_id: @plan.id).includes(plan_item: :user).order(position: "ASC").page(params[:page]).per(KAMINARI_PER)
  end

  def destroy
    @plan.destroy
    redirect_to plans_path
  end

  private

  def find_params
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :content, :image)
  end
end
