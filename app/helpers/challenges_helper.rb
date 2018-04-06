module ChallengesHelper

  def participant_invitation(email:)
    participant = Participant.find_by(email: email)
    if participant.is_a?(NullParticipant)
      return 'No crowdAI account'
    else
      return participant.name
    end
  end

  def status_dropdown_helper(builder:)
    challenge = builder.object
    statuses = Challenge.statuses.hash
    if challenge.challenge_rounds.none? || challenge.dataset_files.none?
      statuses = statuses.except(:running,:completed,:terminated)
    end
    return builder.select :status, statuses.map {|k,v| [v.humanize,k]}, include_blank: false
  end

  def current_tab
    case controller.controller_name
    when 'challenges'
      'overview'
    when 'leaderboards'
      'leaderboard'
    when 'topics'
      'discussion'
    when 'dataset_files'
      'dataset'
    when 'task_dataset_files'
      'task_dataset'
    when 'participant_challenges'
      'participants'
    when 'winners'
      'winner'
    when 'dynamic_contents'
      'dynamic'
    when 'submissions'
      'submissions'
    end
  end

  #def clef_task(challenge)
  #  @clef_task ||= challenge.clef_task
  #end

  def tab_class(tab)
    if tab == current_tab
      return 'active'
    else
      return ''
    end
  end


end
