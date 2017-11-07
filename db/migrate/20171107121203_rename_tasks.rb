class RenameTasks < ActiveRecord::Migration[5.1]
  def change
	  rename_column :task_dataset_files, :tasks_id, :task_id
  end
end
