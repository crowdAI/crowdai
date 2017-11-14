class ClefTask < ApplicationRecord
  belongs_to :organizer
  has_many :challenges
  has_many :participant_clef_tasks,       dependent: :destroy
  has_many :task_dataset_files, inverse_of: :clef_task, dependent: :destroy
  accepts_nested_attributes_for :task_dataset_files,
                                reject_if: :all_blank,
                                allow_destroy: true
  validates_presence_of :task
  mount_uploader :eua_file, EuaUploader
  validates :eua_file, file_size: { less_than: 10.megabytes }
end
