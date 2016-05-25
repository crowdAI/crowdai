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
    find("#mobile-menu").click
  end

  def visit_decks_index
    open_menu
    click_link 'Cards'
  end

  def visit_articles_index
    open_menu
    click_link 'Articles'
  end

  def visit_sentences_index
    open_menu
    click_link 'Sentences'
  end



end
