
class RenameTasks < ActiveRecord::Migration[5.1]
  def change
	  rename_column :task_dataset_files, :clef_tasks_id, :clef_task_id
  end
end
