class ClefTask < ApplicationRecord
  belongs_to :organizer
  has_many :task_dataset_files, inverse_of: :clef_task, dependent: :destroy
  accepts_nested_attributes_for :task_dataset_files,
                                reject_if: :all_blank,
                                allow_destroy: true
end
