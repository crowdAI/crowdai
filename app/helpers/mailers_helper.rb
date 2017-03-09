module MailersHelper

  def mailer_status(mailer)
    return 'Paused' if mailer.paused?
    return 'Running' if mailer.running?
  end

  def pause_start_button(mailer)
    return start_button(mailer) if mailer.paused?
    return pause_button(mailer) if mailer.running?
  end

  def start_button(mailer)
    link_to 'Start', mailer_path(mailer, paused: false), remote: true, method: :patch, id: 'pause-start-button', class: 'btn btn-primary btn-block btn-outline'
  end

  def pause_button(mailer)
    link_to 'Pause', mailer_path(mailer, paused: true), remote: true, method: :patch, id: 'pause-start-button', class: 'btn btn-primary btn-block btn-outline'
  end

end
