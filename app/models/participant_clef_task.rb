class ParticipantClefTask < ApplicationRecord
  belongs_to :participant
  belongs_to :clef_task

  mount_uploader :eua_file, ParticipantEuaUploader
  validates :eua_file, file_size: { less_than: 10.megabytes }

  def status
    @status ||= begin
      if eua_required?
        if eua_file.blank?
          status = 'requested'
        else
          if self.approved
            status = 'registered'
          else
            status = 'submitted'
          end
        end
      else
        if profile_complete?
          status = 'registered'
        else
          status = 'profile_incomplete'
        end
      end # eua_required?
    end
  end

  def eua_required?
    @eua_required ||= self.clef_task.eua_file.present?
  end

end
