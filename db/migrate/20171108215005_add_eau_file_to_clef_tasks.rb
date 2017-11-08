class AddEauFileToClefTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :clef_tasks, :eua_file, :string
    remove_column :challenges, :eua_file
    remove_column :challenges, :challenge_datasets_id
    add_reference :challenges, :clef_tasks
  end
end
