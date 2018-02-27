class CreateTaskDatasetFileDownloads < ActiveRecord::Migration[5.1]
  def change
    create_table :task_dataset_file_downloads do |t|
      t.references :participant
      t.references :task_dataset_file
      t.string :ip_address

      t.timestamps
    end
  end
end
