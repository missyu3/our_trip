class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(notify: 2).where(checked: false).order(created_at: :desc)
    respond_to do |format|
      format.js { render :index }
    end
  end
  def update
  end
end