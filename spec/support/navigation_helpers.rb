module NavigationHelpers

  def visit_landing_page
    sign_in(participant)
    visit '/'
  end

  def visit_challenge(challenge)
    visit_landing_page
    click_link(challenge.challenge)
  end

  def open_menu
    visit_landing_page

  end

  def open_menu
    visit_landing_page
    find("#avatar-menu").click
  end

  def visit_own_profile
    open_menu
    click_link 'Profile'
  end

  def visit_password_page
    open_menu
    click_link 'Password'
  end

  def sign_out
    open_menu
    click_link 'Sign out'
  end

end
