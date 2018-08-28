module TabsHelper

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
    when 'clef_tasks'
      'tasks'
    when 'organizers'
      if controller.action_name == 'show'
        'challenges'
      end
      if controller.action_name == 'members'
        'members'
      end
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
