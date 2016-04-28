module FlashMessagesHelper

    def bootstrap_class_for(flash_type)
      case flash_type
      when 'success'
        'alert-success'
      when 'error'
        'alert-danger'
      when 'alert'
        'alert-danger'
      when 'notice'
        'alert-info'
      else
        flash_type
      end
    end

end
