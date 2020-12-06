class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(notify: current_user.id).where(checked: false).order(created_at: :desc).limit(10)
    respond_to do |format|
      format.js { render :index }
    end
  end
  def update
    notification = Notification.find_by(id: params[:id])
    notification.update(checked: true)
    params = notification.event.notification_params_hash
    redirect_to polymorphic_path([params[:plan],params[:plan_item]])
  end
end