class Task < ApplicationRecord
  belongs_to :organizer
  has_many :task_dataset_files, inverse_of: :task, dependent: :destroy
end
