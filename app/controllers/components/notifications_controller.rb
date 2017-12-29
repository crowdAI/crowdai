class Components::NotificationsController < ApplicationController
  before_action :authenticate_participant!

  def index
    @notifications = Notification.where(participant: current_participant).recent.page(params[:page]).per(3)
    @new_notification_count = @notifications.count
  end

  def mark_as_touched
    notifications = Notification.where(participant: current_participant).pristine
    notifications.update_all(is_new: false)
    head :ok
  end

  def mark_all_as_read
    notifications = Notification.where(participant: current_participant).unread
    notifications.update_all(read_at: Time.zone.now)
    head :ok
  end

  def mark_as_read
    notification = Notification.find(params[:id])
    notification.update(read_at: Time.zone.now)
    head :ok
  end

end
