class PlansController < ApplicationController
  before_action :find_params, only: [:edit, :update, :show, :destroy]

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
    @plan = Plan.all.order_by_updated_before
  end

  def show; end

  def destroy
    @plan.destroy
    redirect_to plans_path
  end

  private

  def find_params
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :content)
  end
end
