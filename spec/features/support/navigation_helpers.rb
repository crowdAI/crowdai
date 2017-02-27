module NavigationHelpers


  def visit_landing_page(participant)
    sign_in(participant)
    visit '/'
  end

  def visit_challenge(participant,challenge)
    visit_landing_page(participant)
    click_link(challenge.challenge)
  end

  def visit_organizers_index(participant)
    visit_landing_page(participant)
    click_link 'Organizers'
  end

  def visit_organizer(participant,organizer)
    visit_landing_page(admin)
    click_link 'Organizers'
    click_link organizer.organizer
  end

  def open_menu(participant)
    visit_landing_page(participant)
    find("#avatar-menu").click
  end

  def visit_own_profile(participant)
    open_menu(participant)
    click_link 'Profile'
  end

  def visit_profile(participant,participant2)
    visit_landing_page(participant)
    visit "/participants/#{participant2.slug}"
  end

  def visit_password_page(participant)
    open_menu(participant)
    click_link 'Password'
  end

  def sign_out(participant)
    open_menu(participant)
    click_link 'Sign out'
  end

end
