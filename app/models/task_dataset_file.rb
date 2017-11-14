class TaskDatasetFile < ApplicationRecord
  belongs_to :clef_task
  has_many :task_dataset_file_downloads, dependent: :destroy

  validates :title, presence: true
end
