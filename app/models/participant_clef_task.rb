class ParticipantClefTask < ApplicationRecord
  belongs_to :participant
  belongs_to :clef_task

  mount_uploader :eua_file, ParticipantEuaUploader
  validates :eua_file, file_size: { less_than: 10.megabytes }

end
