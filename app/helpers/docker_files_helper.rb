module DockerFilesHelper

  def status_label(status)
    html = nil
    case status.to_s
    when 'initialized'
      html = '<span class="label label-info">initialized</span>'
    when 'built'
      html = '<span class="label label-info">built</span>'
    when 'started'
      html = '<span class="label label-info">started</span>'
    when 'completed'
      html = '<span class="label label-success">completed</span>'
    when 'error'
      html = '<span class="label label-danger">error</span>'
    when 'deleted'
      html = '<span class="label label-default">deleted</span>'
    end
    return html.html_safe
  end

end
