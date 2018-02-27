class RenNotification < ActiveRecord::Migration[5.1]
  def change
    rename_column :notifications, :notification, :notification_type
  end
end
