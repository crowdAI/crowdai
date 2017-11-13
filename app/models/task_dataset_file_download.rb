class TaskDatasetFileDownload < ApplicationRecord
  belongs_to :participant
  belongs_to :task_dataset_file

  validates :ip_address,
            presence: true,
            uniqueness: false
end
