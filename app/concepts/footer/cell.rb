class Footer::Cell < Cell::Concept

  def show
    render
  end

  def footer_class
    Rails.logger.debug "controller: #{controller.controller_name}"
    Rails.logger.debug "action: #{controller.action_name}"

    if controller.controller_name == 'registrations' ||
       (controller.controller_name == 'challenges' && controller.action_name == 'edit') ||
       (controller.controller_name == 'organizers' && controller.action_name == 'edit')
          return 'no-margin-top'
    else
      return ''
    end
  end

end
