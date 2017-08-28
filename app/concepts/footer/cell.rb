class Footer::Cell < Template::Cell

  def show
    render
  end

  def footer_class
    if controller.controller_name == 'registrations' ||
       (controller.controller_name == 'challenges' && controller.action_name == 'edit') ||
       (controller.controller_name == 'organizers' && controller.action_name == 'edit') ||
       (controller.controller_name == 'sessions')
          return "class='no-margin-top'"
    else
      return nil
    end
  end

end
