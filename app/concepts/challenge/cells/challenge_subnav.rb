class Challenge::Cell::ChallengeSubnav < Challenge::Cell

  def show
    render :challenge_subnav
  end

  def challenge
    model
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

  def tab_class(tab)
    if tab == current_tab
      return 'active'
    else
      return ''
    end
  end

end
