class ParticipantClefTask::Cell < Template::Cell

  def show
    case participant_status
    when 'profile_incomplete'
      render :profile_incomplete
    when 'unregistered'
      render :participant_unregistered
    when 'requested'
      render :participant_unregistered
    when 'submitted'
      render :participant_submitted
    when 'registered'
      render :task_dataset_files
    end
  end

  def organizer
    @organizer ||= clef_task.organizer
  end

  def challenge_id
    options[:challenge_id]
  end

  def clef_task
    model
  end

  def task_dataset_files
    clef_task.task_dataset_files
  end

  # def participant_status
  #   return 'profile_incomplete' if profile_incomplete?
  #   if eua_required?
  #     if participant_clef_task.present?
  #       return participant_clef_task.status_cd
  #     else
  #       return 'unregistered'
  #     end
  #   else
  #     return 'registered'
  #   end
  # end

  def registered?
    return participant_status == 'registered'
  end

  def participant_status
    return 'profile_incomplete' if profile_incomplete?
    if participant_clef_task.present?
      return participant_clef_task.status_cd
    else
      return 'unregistered'
    end
  end

  def eua_required?
    @eua_required ||= clef_task.eua_file.present?
  end

  def participant_clef_task
    @participant_clef_task ||= clef_task.participant_clef_tasks.where(participant_id: current_participant.id).first
  end

  def form_obj
    ParticipantClefTask.new(clef_task_id: clef_task.id)
  end

  def profile_incomplete?
    @profile_incomplete ||= begin
      if (current_participant.first_name.blank?   ||
          current_participant.last_name.blank?    ||
          current_participant.affiliation.blank?  ||
          current_participant.address.blank?      ||
          current_participant.city.blank?         ||
          current_participant.country_cd.blank?)
        profile_incomplete = true
      else
        profile_incomplete = false
      end
    end
  end

end
