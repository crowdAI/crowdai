module FeatureSpecHelpers

  def log_in(participant)
    visit new_participant_session_path
    fill_in 'Email address', with: participant.email
    fill_in 'Password', with: participant.password
    click_button 'Log In'
  end

  def expect_sign_in
    expect(current_path).to eq new_participant_session_path
    expect(page).to have_text 'You need to sign in or sign up before continuing'
  end

  def expect_unauthorized
    expect(current_path).to eq '/'
    expect(page).to have_text 'You are not authorised to access this page.'
  end

  def visit_review
    click_on 'Review'
  end

  def visit_grammar_notes
    visit_review
    click_link 'Grammar'
  end

  def visit_decks
    save_and_open_page
    visit_review
    click_link 'Decks'
  end

  def visit_courses
    click_link('Courses', match: :first)
  end



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

end
