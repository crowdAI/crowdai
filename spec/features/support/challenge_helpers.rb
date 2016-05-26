module ChallengeHelpers

  def visit_organizers_index(participant)
    visit_landing_page(participant)
    click_link 'Organizers'
  end

  def visit_organizer(participant,organizer)
    visit_landing_page(admin)
    click_link 'Organizers'
    click_link organizer.organizer
  end

end
