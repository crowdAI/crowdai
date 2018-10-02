module ApplicationHelper

  def present(model)
    klass = "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    yield(presenter) if block_given?
  end

  def body_id
    if (controller.controller_name == 'landing_page' &&
          controller.action_name == 'index') ||
       (controller.controller_name == 'blogs' &&
          controller.action_name == 'index')
      return 'home'
    else
      return nil
    end
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
