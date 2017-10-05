module FeatureSpecHelpers

  def visit_landing_page
    visit '/'
  end

  def visit_challenges
    visit_landing_page
    within 'nav.primary' do
      click_link 'Challenges'
    end
  end

  def visit_challenge(challenge)
    visit_landing_page
    click_link challenge.challenge
  end

  def visit_knowledge_base
    visit_landing_page
    within 'nav.primary' do
      click_link 'Knowledge Base'
    end
  end

  def visit_article(article)
    visit_knowledge_base
    click_link article.article
  end

  def visit_organizer(participant,organizer)
    visit_landing_page(admin)
    click_link 'Organizers'
    click_link organizer.organizer
  end

  def open_menu
    visit '/'
    find("#toggle-user").click
    #within 'div.user' do
    #  find("#toggle-user")
    #end
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

  def log_in(participant)
    visit '/'
    click_link 'Log in', :match => :first
    fill_in 'Email address',      with: participant.email
    fill_in 'Password',   with: participant.password
    click_button 'Log In'
  end

  def log_out(participant)
    open_menu
    click_link 'Log Out'
  end

end
