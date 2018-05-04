FactoryBot.define do
  factory :task_dataset_file, class: TaskDatasetFile do
    clef_task
    title "first_file"
    dataset_file_s3_key 'test'
  end
end
