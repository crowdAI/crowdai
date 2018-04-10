module SubmissionsHelper

  def score(submission)
    challenge = submission.challenge
    if submission.graded?
      if challenge.secondary_sort_order == 'not_used'
        return "<li>Mean F1: #{submission.score}</li>".html_safe
      else
        return "<li>Mean F1: #{submission.score}</li><li>Mean Log Loss: #{submission.score_secondary}</li>".html_safe
      end
    else
      if submission.grading_message
        return "<li>Status: #{submission.grading_status}</li><li>#{submission.grading_message}</li>".html_safe
      else
        return "<li>Status: #{submission.grading_status}</li>".html_safe
      end
    end
  end

  def submissions_allowed?(challenge)
    return false unless challenge.online_submissions
    if challenge.running?
      return true
    else
      if current_participant && current_participant.admin?
        return true
      else
        return false
      end
    end
    if challenge.clef_challenge.present?
      if clef_participant_registered?(challenge)
        return true
      else
        return false
      end
    else
      return true
    end
  end

  def clef_participant_registered?(challenge)
    return false unless current_participant.present?
    clef_task = challenge.clef_task
    participant_clef_task = ParticipantClefTask.where(
      participant_id: current_participant,
      clef_task_id: clef_task.id).first
    if participant_clef_task
      return true if participant_clef_task.registered?
    else
      return false
    end
  end

end
