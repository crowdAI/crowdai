class Footer::Cell < Cell::Concept

  def show
    render
  end

  def footer_class
    if controller.controller_name == 'registrations' ||
       (controller.controller_name == 'challenges' && controller.action_name == 'edit')
          return 'no-margin-top'
    else
      return ''
    end
  end

end
