class HeaderCell < Cell::ViewModel
  def show
    render
  end

  def current_participant
    model
  end

  def desktop_links
    links = [
      "<ul>",
      "<li>#{ link_to "Challenges", challenges_path }</li>",
      "<li>#{ link_to "Knowledge Base", articles_path }</li>"
    ]

    if current_participant && current_participant.admin?
      links << "<li>#{ link_to "Admin", '#' }</li>"
    end

    if current_participant
      # dropdown
    else
      links << "<li>#{ link_to "Sign up", new_participant_registration_path }</li>"
      links << "<li>#{ link_to "Log in", new_participant_session_path }</li>"
    end

    links << "</ul>"
    links.join.html_safe
  end

  def mobile_links
    "<ul>
      <li><h3>#{ link_to "Challenges", challenges_path }</h3></li>
      <li><h3>#{ link_to "Knowledge Base", articles_path }</h3></li>
    </ul>
    <ul>
      <li><h4>#{ link_to "Sign up", new_participant_registration_path }</h4></li>
      <li><h4>#{ link_to "Log in", new_participant_session_path }</h4></li>
    </ul>"
  end

end
