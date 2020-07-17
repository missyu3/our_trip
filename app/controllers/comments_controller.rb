class CommentsController < ApplicationController
  before_action :find_plan_item

  def create
    comment = Comment.new
    comment =  Comment.new(comment_params)
    comment.plan_item_id = @plan_item.id
    comment.user_id = current_user.id
    respond_to do |format|
      comment.save
      @comments = Comment.get_comments_by_kaminari(@plan_item.id,params[:page])
      format.js { render :index }
    end
  end

  def index
    respond_to do |format|
      @comments = Comment.get_comments_by_kaminari(@plan_item.id,params[:page])
      format.js { render :index }
    end
  end

  private

  def find_plan_item
    @plan_item = PlanItem.find_by(id: params[:plan_item_id])
  end

  def comment_params
    params.require(:comment).permit(:plan_item_id, :content)
  end
end
