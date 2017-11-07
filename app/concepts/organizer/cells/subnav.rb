class Organizer::Cell::Subnav < Organizer::Cell

  def show
    render :subnav
  end

  def organizer
    model
  end

  def current_tab
    if controller.controller_name == 'organizers' && controller.action_name == 'show'
      return 'challenges'
    end
    if controller.controller_name == 'organizers' && controller.action_name == 'members'
      return 'members'
    end
    if controller.controller_name == 'tasks'
      return 'tasks'
    end
  end

  def tab_class(tab)
    if tab == current_tab
      return "class='active'"
    else
      return nil
    end
  end

end
