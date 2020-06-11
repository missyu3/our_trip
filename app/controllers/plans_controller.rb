class PlansController < ApplicationController
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

  def index
    @plan = Plan.all
  end

  private

  def plan_params
    params.require(:plan).permit(:name, :content)
  end
end
