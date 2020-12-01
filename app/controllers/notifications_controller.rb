class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(notify: 2).where(checked: false).order(created_at: :desc).limit(10)
    respond_to do |format|
      format.js { render :index }
    end
  end
  def update
    notification = Notification.find_by(id: params[:id])
    notification.update(checked: true)    
    params = notification.event.notification_params_hash
    redirect_to plan_plan_item_path(id: params[:plan_item_id] , plan_id: params[:plan_id])

  end
end