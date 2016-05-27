module NavigationHelpers

  def visit_landing_page(participant)
    sign_in(participant)
    visit '/'
  end

  def visit_challenge(participant,challenge)
    visit_landing_page(participant)
    click_link(challenge.challenge)
  end


  def open_menu(participant)
    visit_landing_page(participant)
    find("#avatar-menu").click
  end

  def visit_own_profile(participant)
    open_menu(participant)
    click_link 'Profile'
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
