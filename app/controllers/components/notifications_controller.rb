class Components::NotificationsController < ApplicationController
  before_action :authenticate_participant!

  def index
    @notifications = Notification.where(participant: current_participant).recent.page(params[:page]).per(3)
    @new_notification_count = Notification.where(participant: current_participant, is_new: true).count
  end

  def mark_as_touched
    notifications = Notification.where(participant: current_participant).pristine
    notifications.update_all(is_new: false)
    render nothing: true, status: 204
  end

  def mark_all_as_read
    notifications = Notification.where(participant: current_participant).unread
    notifications.update_all(read_at: Time.zone.now)
    render nothing: true, status: 204
  end

  def mark_as_read
    notification = Notification.find_by(id: params[:id], participant: current_participant)
    notification.update(read_at: Time.zone.now)
    render nothing: true, status: 204
  end
end
