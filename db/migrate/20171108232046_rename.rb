class Rename < ActiveRecord::Migration[5.1]
  def change
    remove_column :challenges, :clef_tasks_id
    add_reference :challenges, :clef_task

  end
end
