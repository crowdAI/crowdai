class AddNotifCache < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :message, :string
    add_column :notifications, :thumbnail_url, :string
    add_column :notifications, :notification_url, :string
  end
end
