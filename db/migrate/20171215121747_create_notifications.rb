class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :participant, foreign_key: true
      t.string :notification
      t.references :notifiable, polymorphic: true
      t.datetime :read_at
      t.boolean "is_new", default: false

      t.timestamps
    end
  end
end
